Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFD9C4707B
	for <ath11k@archiver.kernel.org>; Thu, 18 Jan 2024 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:CC:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ivb6fA4GB/iZ9fp+quHjh2r0bR9gLFFsI19HY2Ou1j4=; b=MHXDV6wuxZtqrM+XZSUktLI7Uh
	iRuxsBgojtX8tMKkfLZkhnqnoq3fRxwzymkB6vPvBrNQa3OsbiJS2gXDzuooGx+gox4HPx/zaWsjT
	BXRT1MKRDGUFgg9a9dgXMG4rl+VLUk9BC9SSgC1fn+KBAt+daRMeKHoDyrQz/5Ph1oxGoN5YfmIPr
	/qwKucYU5xW6np7UevMQHwlfZ0iejO05pSbq8hFdg7lvaWaR2Z9dtR3MW38yJXzzt2PBerQrkjQMk
	zlTuMkbFLiA7l4u/bi5RVsyV+4lQDAb4pji7fozryAKcoIlyIm1pXYlBq8jMlAadqORrW//mSzrOn
	2m604EBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPlf-002Peh-2i;
	Thu, 18 Jan 2024 10:37:03 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPlZ-002Pdx-0a
	for ath11k@lists.infradead.org;
	Thu, 18 Jan 2024 10:36:59 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I5oq7r000669;
	Thu, 18 Jan 2024 11:36:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	message-id:date:to:cc:from:subject:content-type
	:content-transfer-encoding:mime-version; s=12052020; bh=Ivb6fA4G
	B/iZ9fp+quHjh2r0bR9gLFFsI19HY2Ou1j4=; b=MLihYbyW5uKHYwButwZBpfQU
	rkn2eyURx9b1q7PBGbnDKwwCw7Z8s/VMRBzf1f7xSheUeVbZqt+Csmy6L4MwUSn+
	6Sq3P8ig8hIXdz6ciwyXQQdoTKAoVoyW+OwWjVB6ZmoIY403zThggwzei4J9YUqv
	8BeHsB4BR1Wosu9EUsfWD0czXg+zPlK2eqoJvyxLcsu5sB4fbL3eu9f6Q0+cazUq
	crE15Kju8S5mNTOuOy8x1sY3qtnShOqrDs22iISEgMCDu4LbOFgfmJBNW45CJUNK
	dgTDSEnF0jhQKU6cyD+QxqDbcI3SK3fe4Ah64WVvTWN47zU1sKtWAI2G9MS0cA==
Received: from mail.beijerelectronics.com ([195.67.87.131])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 3vkfrbxaue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 11:36:43 +0100 (CET)
Received: from EX01GLOBAL.beijerelectronics.com (10.101.10.25) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.17; Thu, 18 Jan 2024 11:36:41 +0100
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.51) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.17 via Frontend Transport; Thu, 18 Jan 2024 11:36:41 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAGhq6DAijpK+N7D8+BqEKqF4lAGXbSgUlIVe/4tcXx2p2WHHoQAtr9skeDq2dRzhWunLnYTs61ETLrpud0TqWkO7l6NmidKZh3XB0euBlpLRcXX34TtnkwFxccFVpHJkBdnmjimsxNdLZenMw12UUM1yTwEn/dMaC1GZtP7OxoDnXSw+ygoATdYqqzA1LpYDj6pAokoUDKY29n23B8ylv2tHJ5ju1cQuH+semM/jMtTkFV+505AtbBGKc1LiYBMgFtfYov0x8VeQPYd9CFxonYDPdzzKNOLMf9QtM3HQA1c10xrYDQ1rP56RSjH8OkR+pmuM4Bc8SKKGoa1Ebn87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ivb6fA4GB/iZ9fp+quHjh2r0bR9gLFFsI19HY2Ou1j4=;
 b=EVtXRqlzfcJ28Ad+fCkn4WyX+Z+76WB3ZtHwAj3aErSZKhIg+PCL/m5OjhBPJMNFvSqabo3o11s45I24KRMq+LW/IlLtv8LJhspMWtfpmhPRiq6+StH07cA2VLu2fQgofxxDOKlgQQJI2sXT3SVP7tv1q/BwYQI/JzKBfQ/LigJYtR6Uas5pJeL13CIdqseONMiwORpptMRyK+E3t6WJYjsYQQnfvrOZS9LTmf7u+qcO7RBng7+sPucCMsOu50jD6dH/UDYxYGBf4gI7R68rylgFlceKynCTuCTZxi/GRvV2Ap0RZn4o0zbb/rOJt3p+wf/FEoiCiotlb0ctsdoGrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ivb6fA4GB/iZ9fp+quHjh2r0bR9gLFFsI19HY2Ou1j4=;
 b=yC+f/8hJYCg8s/b8iJQiXroSwYGPa9lonMUwdTX/JT8r1zAP5JFbhkaqRJ8pToc6swPqN5ngEUOfi+rew7+oivc+8abniwhQt0NcNfxO+mMP6hQHSUlMzx8HibPdhWRHkiHWiUsH6I8SXDUo5iKEDARtrFD4EE3JsKA/2B8zf5U=
Received: from VE1P192MB0734.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:16c::15)
 by PAXP192MB1406.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 10:36:35 +0000
Received: from VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 ([fe80::c13c:49f8:c9bf:2e86]) by VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 ([fe80::c13c:49f8:c9bf:2e86%3]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 10:36:35 +0000
Message-ID: <3168a24c-fdfa-456d-ae23-59a54b9d0212@westermo.com>
Date: Thu, 18 Jan 2024 11:36:32 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Subject: ath11k: external regdb for QCN9074
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0059.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::12) To VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:800:16c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P192MB0734:EE_|PAXP192MB1406:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee277b4-e969-416b-0946-08dc181157ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JtmGPX2q3d6mKo6EhplndhHIGB3vRHfiDDqYVopgdoWUPsuRyxxWCibVRIsn85wTOBT1QirPge5SANrjN3s2zx+bnnOggmBvGXbVCzd3Rx08dBS37kDGuWGocbEX3nhj1rVVCW6Oq43OQwPNPeyJXMQWh1QJn02uDo17bpR9Y7GEWWGr6RvsCiO3UY2FwVdWqsFZce6JY980VK0WFfIRCaeyWdLuu+MomZ2UYObrwnCw96NkMJqN2r+9RGyawapUMI24lGyLso3Gvkyc3If87eBB25pZAejAmS8hIuwRwAGfimF7N9IQBH9XwO1vWoz9lPTPw6qrgLDtas62LZrd9aty00IFISIu5HxlpMJcCZwa9BsyiqfGLOwPL2Nh0OZcfsFpHJ2TkMd08xLyYH3AoCOTszr2h3fXfTidHvpp+1USmShe195+8RiOAUxe6qP6/ow2DUVPXlAIO2pTjquhfGxtuDXzLDAJrxKYgEb28jaSGdcCT74NHz0aNtFHOuEvXSFcQWiZgUQscWzZJtzfAxeGkZcO7kg0cwwcdqsBKMMDKl/i1oqn+3r9LeR8zcUJDPKEfjXTi4vu0OCB1ztL0xRHuq/yL16DzyC1B3Cj+dfuA6UtGCaglxvYC8F6m9HQJWMyNhzQwtG9C1+Yg35Ang==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1P192MB0734.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(8936002)(8676002)(4326008)(5660300002)(44832011)(36756003)(26005)(31686004)(31696002)(66946007)(66476007)(66556008)(6506007)(6666004)(966005)(4744005)(2906002)(6486002)(478600001)(6916009)(316002)(86362001)(83380400001)(2616005)(6512007)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU5idTAyb2tKamJuMjJZT2Fhekc1ZTF5YWdmTUFITGlIMUk0YjlucGk1ZSth?=
 =?utf-8?B?V3oxMm9SNlJWeHl6UW5XUWpvcjduYnExaHZrT3VXTjA4bGptU1RMZDZzdzZ0?=
 =?utf-8?B?aVJia3k2eTVRWFZyT3c5Yk8wdm0welRxMis5TElrRjF2Wm9aSks4bm9ndDc1?=
 =?utf-8?B?Ry9vcmRid0hqeG1sMlozeWU2Nlg3elJyQlUrSUdtSlJqYmR0akNQWTVHUTVp?=
 =?utf-8?B?ZExIaEdWU0xVVG9oOURqQ29TQzQ1Ri9mTitSUjY4eWZnem1ZbXByV1ppNkhC?=
 =?utf-8?B?ZGlHOUIxK0NaTTEwWTZCUDUrMnZXZzRoanc5MnVsK25vV0k5bEkzQzdNc2Ey?=
 =?utf-8?B?c3lVODFOWEdXLzUvQ2Z6eUdzYkM1QUFUVTlkVGswY1ZWbVN6a1dyOW91Qmdo?=
 =?utf-8?B?Mm5YeHRYWWZSYU5iT2Q3dE5OS1ZxaktPSlhtcm4wTTF6ZWhjRzZpR1M5OEdz?=
 =?utf-8?B?RGZZWC9YYVN0OXpJS1FzZDVKVDBMbUhjRnlPeUtyZTFLZmlvKzQwVk1ES1Rk?=
 =?utf-8?B?VUdZSlQ1R0g0bEF1NWkrdnZ6Nmd1bEpEaTRHT3FGZGc5emlENzdTWjB1eXBE?=
 =?utf-8?B?eS82UC9CNDhIQ3dIMUZJUGRuMjNOU3VTUUdRMzB5ZlRNNUV1dzF2MTI2cmsr?=
 =?utf-8?B?eW9VREI2SW9CMXNyR2JNMUt3cEpjQzZkelhTMC92bGZ0dERicXJUQkNITmJO?=
 =?utf-8?B?NHFFNG9yTnYzcjRuUDRCY1dPRFJDS0ZvSlRrY2RDTWVhSUZDTUZhZzI0VDJw?=
 =?utf-8?B?eGlFdVo5ZUJrU3NPdlc2WkRtdGtpM2VZMFRPVGZ0anY3Y29QZTJmNFY0b2Q2?=
 =?utf-8?B?cENZRFRGak04eXIyKzlWRVlFS2ZoUnc0QmV6bmk3ZkFJc0h4emJxTkczc0tv?=
 =?utf-8?B?Sm9SU25saU5zVTVkTVd5NTZqY1dRT2lwWUVWQ0U3bzdoRVhWY2hNRDM3RXRj?=
 =?utf-8?B?UHpVZ3pxc1JTalhxTzJ5UGZwRHREdmh4RXpNNXFEc0VVZjBKanp2Y2x6WlZI?=
 =?utf-8?B?N3FlaDVrV25JSmYxUlNGdSt6dWQ0VmJMUVZaazJjWHNWMjVIZk5UY0F1RTRy?=
 =?utf-8?B?ektCeW1xVFdzaWdrTFVvdVV0N3MvUmdIeUJuekVNS0Z2SWZaL1Y2UmlJVTZY?=
 =?utf-8?B?Q3A1UFExY250K2NJMUIyQXVwSTdLU201WjVMdTUwWHY3cTRnVjV0cUhXM0k4?=
 =?utf-8?B?cEdOcUNVT2pPb0lUL3VPNUlTdFFEUmtpYUtiNythT3pQUno5VHppc3VBbWI2?=
 =?utf-8?B?VFB3L2liRUZKckFHak4xN3NuWWdlL2pjS0ZzNE1hUlNtOC9SYlRQNUk0cVJC?=
 =?utf-8?B?Qy94L0xRdnhEaWtYclJlYlBydmxJRlp4Qko3Ukd5TC8wY0NFU21hc1ljNmRT?=
 =?utf-8?B?Q2xyeGtpdzFNVmQ2REUrbngrN0dDN0p1M3JwYkJZcmNVNnk4T2dQbkUvNmJm?=
 =?utf-8?B?TjlVelhWeE5EK3hleUdiUm53NFRKQzN2Tm1IMFF6K3BQSkpCUGJjYVdERytp?=
 =?utf-8?B?L2F6WHZkcDlteVR2YldxaGlUMU1nUDN1aG12ZW94V2xKZjZ3QTVzVkNpNXhX?=
 =?utf-8?B?bGtZUDVJY1pRbURzWS9qWHFXUEk3Q2U5ako2S3l2U3FhVTZSUEdlTnV6ajc3?=
 =?utf-8?B?OVp4c0kvTmo2cXRFc01FRUlwb1JMdGN6UHhMUE0zTVV3YVFzY1RLOFIyUDlu?=
 =?utf-8?B?ZkZoMWptWUN4emZuMmg0eThuSXJkMW1mOE5XVGNhYTdTODZSVXJZWXc3VkVH?=
 =?utf-8?B?Wjd2UDg2ZU9BTStvbkxJcHg4WEsvNy9seVRIcDdJNjF4SUE3Nkl6OEF1SzZ4?=
 =?utf-8?B?QUszRkJtL281djZHaWdscFFhQVE5dGZSQ0NHRmZMWXQzM0tIVlR3cDUzWm00?=
 =?utf-8?B?UkI4ZWJ3bkFBMGthM0tia0dkV2E0NWtJbHd3cG8zc21xK2JqemdyMzRDODZH?=
 =?utf-8?B?RW5TQUtXQlNXalc4NXVWMWxpRHQ5Q3NLMUtVTExnOFBNVWZleXdqOUY4WXJl?=
 =?utf-8?B?M1VsYW9YY01IeW5TOVlKL1FBZG5xNUpzRmRlTHBtWm1lYTJVZkkxK05LaUZY?=
 =?utf-8?B?WXY3OVQwMWlRV0dBQTBEQVRMNWRVSlhuMDhHYzhudGNQSXdnU2haREc3RFU2?=
 =?utf-8?Q?lTQ/7AQ6M+DQNLySVOrfRi8/z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee277b4-e969-416b-0946-08dc181157ea
X-MS-Exchange-CrossTenant-AuthSource: VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 10:36:35.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5H7v/56+DhT9ks4nhsADKbydGZ15JQA1qFQzVnf0edkkvMnN6Qv5p40k5e0Pj59GxF+qBsq2I6rXfdttzTACQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP192MB1406
X-OrganizationHeadersPreserved: PAXP192MB1406.EURP192.PROD.OUTLOOK.COM
X-CrossPremisesHeadersPromoted: EX01GLOBAL.beijerelectronics.com
X-CrossPremisesHeadersFiltered: EX01GLOBAL.beijerelectronics.com
X-OriginatorOrg: westermo.com
X-Proofpoint-GUID: km8yFqVB1cz1QNvYk7Sh8ZyeJuVHnY6f
X-Proofpoint-ORIG-GUID: km8yFqVB1cz1QNvYk7Sh8ZyeJuVHnY6f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_023657_988571_B16F7D9C 
X-CRM114-Status: UNSURE (   5.11  )
X-CRM114-Notice: Please train this message.
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

Hi kvalo,

I wanted to ask if there is anything new regarding the bug https://bugzilla.kernel.org/show_bug.cgi?id=216832. I would like to run the modules in the ETSI regulatory domain and the board files in board-2.bin are slightly outdated. Especially the board ID 162 for the 6Ghz frequency band, because all channels there are blocked for the ETSI region.


Best regards
Alexander Wilhelm

