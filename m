Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952ACC47258
	for <ath11k@archiver.kernel.org>; Thu, 25 Jan 2024 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsias7YVGJbcNkWJoKWqXrqMB+WtYFaOEswiPybsJJ4=; b=PPUnhdeJQhUFmYpHx3Ud5o4Oew
	2ODQIkZ/vHAeTv+o3Ad2GaChAG8kmqOyHImMGJse4YFn7iZFQMyhvQ3CU73sfbTYA6neuOBDAvZz1
	rPezYq58ZmDquG7qBgRLUelxToIrcRCrk5aT3p8wHsMCZK7S3gTbwd1x97JYPJnMY3GLmF5xK3/ND
	6EecC8xORwy0I+NOKq5aJNQk9RXWyJ6AZ0VrgsgZ+gHoukC41Cr2+vshJD4dnPwbnwBXkpOxx6TXO
	j/4ir/aHApglJYAcKXg2+sj9BfdHRZ7TAgI1WZ6iVuwd64VXzrmGnLjWKdZ4agi6z24No2kQYn1RI
	snMtykyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvX8-007Prk-1M;
	Thu, 25 Jan 2024 08:56:26 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvX2-007Pqi-0E
	for ath11k@lists.infradead.org;
	Thu, 25 Jan 2024 08:56:24 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P5Ra5F027467;
	Thu, 25 Jan 2024 09:56:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	12052020; bh=wsias7YVGJbcNkWJoKWqXrqMB+WtYFaOEswiPybsJJ4=; b=rZe
	+lGHNdPKSNGQ20gTete2t4h6hJodoEQvr2Qji6RxqV+LSWB1isFXmzDZVJT39qmy
	v/ZaK8AZbtskdxw3/EAEDT2iVrAKyD10zq5MroJ4nblAkRt5oKMijSBvdeYQHyoD
	vpHZDthVIYmpzGZB8Zks3CMEe2F7bvASqGrBNnahffHPcT1lnQR5zmhB80AVdywS
	fQVcpy6//VF3fsLEOga0Do7WaWWXZIVZ9re0gUAkf3OV5971WKRiX5LKAGe5z0mr
	bJ1laZvMDCwezw8F8Cj4Rg/jU1A94dlEvrVJ/X6Nw+bO+H6RHW8QKyeB8RVUe8z9
	4biVGHwplzxDE8Hcq6w==
Received: from mail.beijerelectronics.com ([195.67.87.131])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 3vtmgbhv1h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 09:56:13 +0100 (CET)
Received: from EX01GLOBAL.beijerelectronics.com (10.101.10.25) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.17; Thu, 25 Jan 2024 09:56:08 +0100
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.51) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.17 via Frontend Transport; Thu, 25 Jan 2024 09:56:08 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/baLY7gAdTawVLy4mI4lGYXD3oHB/PngOqZ/viPtNNbbfCtHsPW74FE1ueKzEZjauf4ad9u0pq6TMaTpH5siaeAGfe5MJ6JjNAwl8gpXF+XLgaPJVbn4A83BV6O/aoBrUYV2OXyxYWqBQ+an0TZtJuc4t8z4uoKdnaD2kgP9lhfchIR7m+bIUnKfb3QjgJNFWM4LIsIiXAF6RFvHugCL6LwmgQWFHiSc4/Mjk38XeFrdXXr8EkgcBvYmwjmGkxb8KYM0QxCy/KxFqdUU6Mcg58S5XnaZCNFrCcNbkLhoAZjb4xv4QIyYitz/xNk9BrIexUcYKrXQtEm/rjGaOTk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsias7YVGJbcNkWJoKWqXrqMB+WtYFaOEswiPybsJJ4=;
 b=FGMoIRe0/E7vHJTNy5gqO5nA1U+q4JZwWo+UAAysfApoGf5wzHYmJRAm9E2wc5XVolSBqZdbrlJ9GfrlGAKsuL1gA0uFhgXjx0lAJOtnBdzP9YrhKDWqKKEj9wSoyR/R/HsVMV+YfLlDSJWGvJp8+nOaBwqHz6R3/4YC2U3+yCz6bs+s6vv3SBMSg+l/1H7bEI/HzZlTeO9VOKNPQKOe2jeTBbkIDSbYlvzAMxyr5rvHsOgYsMuM9ejk4J801p6gtWWx5yFq33KPvrDyQvpheX/tEoDkXrbdKglNYIiMhcOMxvZE4vKXrxhiCFlYKiBqkxEs6kS59vXIK9iCvshmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsias7YVGJbcNkWJoKWqXrqMB+WtYFaOEswiPybsJJ4=;
 b=QLw0G7BhjMNkYCWusAGIlWmtXeU1Yqe7DNFLS00QUSsguUFY1h7G6Z5sGYjgb+3RyWJtS2e7mDyhAvn2d898eRRYvQFHZlbnMdg+0U2GVmQk0I5o1Y1RlKKxQIqiPI9KEWwFWDxhOyLIZgdnP9jYNFZCqfrotrrXc7L0A+92u+c=
Received: from VE1P192MB0734.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:16c::15)
 by PAWP192MB2104.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:343::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 25 Jan
 2024 08:56:06 +0000
Received: from VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 ([fe80::c13c:49f8:c9bf:2e86]) by VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 ([fe80::c13c:49f8:c9bf:2e86%3]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 08:56:05 +0000
Message-ID: <8bed350b-e90a-47ea-8c7a-4a5f62e6ac36@westermo.com>
Date: Thu, 25 Jan 2024 09:56:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: 512 client support on QCN9074
Content-Language: en-US
To: Robert Marko <robert.marko@sartura.hr>
CC: <ath11k@lists.infradead.org>
References: <d857016e-7bea-4f77-8931-97b0d56751f5@westermo.com>
 <CA+HBbNGiM9hyFCFq9-sWgL_DFHNKzdDeW3v2YHR0Z9YXxbG1jA@mail.gmail.com>
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
In-Reply-To: <CA+HBbNGiM9hyFCFq9-sWgL_DFHNKzdDeW3v2YHR0Z9YXxbG1jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVYP280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::22) To VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:800:16c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P192MB0734:EE_|PAWP192MB2104:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cbec8c-b620-4b7e-9697-08dc1d837712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PShXbZX/yN5Ous9vlvGrUQ7yAhnyjZxarX8n5ZoV1E8LOo8SEBhdl+EFAK+2mM9tDEbnvc+uKYi/o1VPw1tlg+JHrRc5BvE4NnpoQEqYMLeXB0rQOBONOpBQDVoQt7qhi9z5xYuT2g4I0caNgJMnM2zw+HGq3bQw99I9w5akXylRxOwRfOexwWzZc/iQcAI76CB1wlRbji0xzh4tP9PFfxt+mWtNizuRxXHolFeZDUCgQah8zGupPT+UCG87IMFO/GuOlH5Er6dgfQNiYr2LsK3pLPm7F8+lDBPmMipB2N6EbRMjK+ZSz2cTDZAg5NcsAPOp2l/AT/9SOfTbAVajluubtQ9trmRtwJGvnIJcW8PDlcfQA63oVRPMy3hLA5t2qJjkZ0SB0p7DWYo7cWhJkb0ukKYPjDXjp7J0tdYOFRZ+ZeNHzirLIaYmXwTgmz99mFdICDWPu0+LShq0g2ZZyoAox3cTPHRwhXSZQv4NZA0GEz0JrQDeVi1g69twNiQSlVXrE6sRNq+0vrbLwFXjeutj474EDb4xQEFDv/M4EFSVydvHea4hMXWrQtMt4ShVQv+0y4aOvugdlJBgMFmF1ddqVQY0ZRq7WSS9UllGFOlEGnKfL9qvgnbeKcXoSwWCUxy8P2/VI2REq24lb5cBVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1P192MB0734.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(39850400004)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31696002)(86362001)(31686004)(66556008)(66476007)(66946007)(6506007)(36756003)(6916009)(316002)(8676002)(4326008)(8936002)(41300700001)(6486002)(478600001)(53546011)(6512007)(38100700002)(2906002)(4744005)(5660300002)(44832011)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0g4TTZtWmNFRDE0NkZuY09vV3VQOENHbC94Kzd3byt4L21NVTAyQWxvbmkx?=
 =?utf-8?B?NG9MdWgxTVZlekFqQTF6VmhOYVE0Q0ppTTg1bGdJL3VCcGxNYXBYaXJxcHlC?=
 =?utf-8?B?R1FKbGMrWE1NTzFqT0F3Sy92WTh4MnpnYVpIOXgydStycXN1K0JTZllyQTJx?=
 =?utf-8?B?OW5GajAyTitpQloxeFFnZHE3aWNFZGczYno5elFERVlVTGNVOGYrcXVKZHlp?=
 =?utf-8?B?Zk5Ld05SR29hOHppemZBRG4zTy9PdkhiVEFUNmpmTkJWb1BsR3lHS042bGRo?=
 =?utf-8?B?UnVXaCtLNVFWa1oyUXJWcnJXQlk4SnRYSjNTV1FObk9TekVya3JDR2c1V2N4?=
 =?utf-8?B?a1VnekpTWHBYTlJscVU4QU1KRnJDSW84Vk52a0hKT2lDY2NuSnVZdTVYRFdj?=
 =?utf-8?B?NUxKVTZLMTgwTlZ1WDFJUDY0NEZUSnZvR1Jhb24vMk10bXRuOS8rVlY3QlZS?=
 =?utf-8?B?NzJsWk1MT0orVWNLcFJ0UlhVK3VWRXh2SWlHQzhoK3ZHei9PZnhVczN3eUVr?=
 =?utf-8?B?SW8ycXBKRWJXU3JhY0QwVmY4d0wyQTFjTHhrY09wdmREcDE1cW1zY0xXS0ZP?=
 =?utf-8?B?M2tTaGVXdkZUYzNHRHlYZXBzYVZ4Rm9rYXFGMGNqU1cvQU1yRTZjRDRyOUYz?=
 =?utf-8?B?OXBSRVVwamxyUzJkZ0RDbDVjYWFkTEovcVJOMUpMTm5KNFlkSTB4clBoRFNr?=
 =?utf-8?B?WDZ6UmpkaW9uSjJuSGtSL3pLMTdLLys0QjNFd1FYYm9yRU9xQnFtTnJ3dUhu?=
 =?utf-8?B?SXhaQW5GMTE4eDVrVnYwTi9xN3JJeDBNekRkd3RGVlhYdXgwQzMyL1RGVnFT?=
 =?utf-8?B?Wll1dktzSnM2M0p0TjZFNVExTFFXR3dISzFtcjdwcjJabE13QmpUZFpyWFNE?=
 =?utf-8?B?cnd5QjFQTFc0WEZVSmZiT3dlUHcwd0x5K2h6Zm80VitTME9RZ2gxT1NyVTNo?=
 =?utf-8?B?VDFuNW83d2h2dHk2ZWdUdDhTNXlIWFRxYlFaQnk0SnVNZFNBa2NKbnFmcFdT?=
 =?utf-8?B?c01RREU3NnQ3QmlMdXJIRCtxU214ZTEzNUtyMVpzd0cwM1hwdWdyVkwxSUQ5?=
 =?utf-8?B?Y2tIU1JEbU0zMWwyMHgrMDhiZXRKMGc4NjFrTC9jM3JzbWlJaW9IVy9NM1NK?=
 =?utf-8?B?M1FrS1BnSXYwdGxvM3RYbG8zV2xpVERFZlUrdjlvUjFUaFg0MXk4Mm01UlJl?=
 =?utf-8?B?K0RhRm42Ym5iTFFUYUdjWk1kc2tIVlA5SnQzaGhUdWdCQXEveWwxNUdlZ3Jr?=
 =?utf-8?B?WXFNWXZDZ3ozWlc3RVo4eFpKMjk3NkE4TlhjTldZZzd2ekpaY1VMV1c2ZlFp?=
 =?utf-8?B?NU5kZllrTi9yNmJ3aDNNQS9Ocnlvb2MyNzA1Tk14VHZiMS9hWUtiNFFZcXIv?=
 =?utf-8?B?QnJMakh6N3I3REtPbmNYMWZwVVU2Tk0yZkNyVXh3NFBrcTc5cW1abDQvc085?=
 =?utf-8?B?dzRLUEFkcTgwWTdvL1JocHhBemJXa2grRWpRUFZEVE02WHUyRjhtK2xsZDVN?=
 =?utf-8?B?VzcvbzZMS1hCNE9JTG5vR2ZOQzRMSWplYzlvZkk1Tkl0QVRGOUJPdllMenNl?=
 =?utf-8?B?aElxVGJRUEtaMXJybllOMG82Qkk4KzJxV1JuODBsd1dyN3pPbUFDeXl4KzlQ?=
 =?utf-8?B?N2VEaWI3WG5nR2h3Y2p0RXRiVXZ0VVVYbzVCSlg2ajE2NWN4VVFxMGd2Vnp2?=
 =?utf-8?B?TjRLeUx6Rk1Ma0VxbndZek1UdlJwSVUyamVXejArcGdoUjVPWlVKVnZlMXNo?=
 =?utf-8?B?TmZZMGxBMnNpOVBPNENIajNPSXFPZnJJbzJGMTJoM2dCL0F5SFJDM1dObW1S?=
 =?utf-8?B?SkJkY0pXcURzMHhoM3BIRnNscS9GbVByY0hrR2dKQWRMalpBdjRmb2NNelFy?=
 =?utf-8?B?UW9GT3JZSFo4L3NTaU5SbVF5WU1oZkEwbGJZa0s3NSsvalhnQzNHU2xBM3dh?=
 =?utf-8?B?RkhWM2FvSWVna1ZlRm9zQXBvV2VyRmNvbjFNdFJsNHlYbFBvRnNGMW11UE9K?=
 =?utf-8?B?WlJ6VkRoYkU5RW1LYzhad2paOHE3aWJTcnBGaDlENGJOREh6VDVTRk5tb2Fy?=
 =?utf-8?B?S0ZSRVgzTlZlaEJXb09POUlXZGlGU3BMK2owU1RkRVBwM1U0QkFLNDhYRW1I?=
 =?utf-8?Q?F8gHvIU6qelBs9oHaR5ZueTHy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cbec8c-b620-4b7e-9697-08dc1d837712
X-MS-Exchange-CrossTenant-AuthSource: VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 08:56:05.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3P8z++flP92xR+bEJVPciNCVpnKIeAYWODQDKKuk+VjEJo2MxoF/c8/YPMH+piEIAajrxc+WIgVrpOuF3hHXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2104
X-OrganizationHeadersPreserved: PAWP192MB2104.EURP192.PROD.OUTLOOK.COM
X-CrossPremisesHeadersPromoted: EX01GLOBAL.beijerelectronics.com
X-CrossPremisesHeadersFiltered: EX01GLOBAL.beijerelectronics.com
X-OriginatorOrg: westermo.com
X-Proofpoint-GUID: Mhq2g_mhxcKipuA2PvpJpgewPxWriLd1
X-Proofpoint-ORIG-GUID: Mhq2g_mhxcKipuA2PvpJpgewPxWriLd1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_005622_380263_84B7A087 
X-CRM114-Status: GOOD (  11.77  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 18.01.24 11:32, Robert Marko wrote:
> On Thu, Jan 18, 2024 at 11:31 AM Alexander Wilhelm
> <alexander.wilhelm@westermo.com> wrote:
>>
>> Hi kvalo,
>>
>> The QCN9074 module with the ath11k driver currently only supports 128 clients. It should actually be able to support 512, shouldn't it? If so, is there a firmware restriction because of this, etc?
> 
> For that you need to change the FW mode to 0 as I think it currently
> defaults to 2 to save on memory.

Thanks, it worked. I am able to use up to 512 clients.


Best regards
Alexander Wilhelm

> 
> Regards,
> Robert
>>
>>
>> Best regards
>> Alexander Wilhelm
>>
> 
> 

