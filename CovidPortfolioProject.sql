use PortfolioProject

---Looking at Total cases vs Total Death
-- Shows likelihood of dying if you contract covid in your country

SELECT location,
       date,
       total_cases,
       total_deaths,
       ROUND((total_deaths/total_cases)*100,2) as Death_Percentage
FROM   CovidDeaths 
where Location like '%Nepal%' 
order by 1,2 


--Looking at Total cases vs Population

SELECT location,
       date,
	   Population,
       total_cases,
       Round((CAST(total_cases as Float)/CAST(population as float))*100,7) as CovidPositivePercentage
FROM   CovidDeaths 
where Location like '%India%' 
order by 1,2 


--Looking at Countries with Highest Infection Rate compared to Population

Select Location, Population, MAX(total_cases) as HighestInfectionCount,
Max((CAST(total_cases as Float)/CAST(population as float))*100) as PercentPopulationInfected
From CovidDeaths
--where Location like '%India%' 
Group By Location, Population
order by PercentPopulationInfected desc

-- showing countries with Highest Death Count per population

Select Location, Max(Total_Deaths) as TotalDeathCount
From CovidDeaths
--Where location like '%states%'
where continent is not null
Group By Location
order by TotalDeathCount desc

--Lets break things down by continent

-- Showing continents with Highest Death count per population

Select location, Max(Total_Deaths) as TotalDeathCount
From CovidDeaths
--Where location like '%states%'
where continent is null
Group By Location
order by TotalDeathCount desc




 









