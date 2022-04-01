Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18B3C433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwPmuOTTY1BAR2lCEXT/DEkmzFPsvPmMiVTBTXyaYhI=; b=sDRcaEonB/Q1bS
	MIMyQA/lx4F6mV/zm5p3YyrcClp1Ev2ALIkH0WL8l74i5r2lzwM7nHe+2tP2ETLuumKXUP6dWPLll
	jxzbqKrDFkCryhdl0EmC3qpFOw46dqLclV+4xINtpF9+kNB3JTyIYpLsn0KujnDf6hrfkdKhsmVNf
	eiNDQxxgKekg0attZ6V0AdG1tCc1L2RGGOATmv3xfDyBprum1dizBpKMoGLZhDQ/u48EimuX42YJ+
	zi2M0YsHirf78H0cOPwFwONuZJ/NHDXh/yCzzMyM4ohWCF8mcJpuZNqLD+pBmjKM3ddsk4LysR3VY
	K9OEIyvqrnMi4UyQJOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naHsP-005tWV-BV; Fri, 01 Apr 2022 14:03:45 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naHsL-005tVt-MI
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 14:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1648821821; x=1649426621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iXLQy59K33YzGAiruOwLhXZQ+40Nixj6U4QkVwit73Q=;
 b=Gzb91HlroZMo6FVlTEQpOqLsFMJ8rTx32kXHViY+JRzTtWneKTI4vVNx
 SY5MI7D3WCThCGjaNimU4X/quSeE0PHcyaSjNBKKxZCd9qbVH4hGtIC4A
 wrn5VqeiWAXqAmyjkcCtEG1TKam3UXN0Ka8n7/S6CgJk975X4/cmhIeUn 4=;
Received: from mail-mw2nam08lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 14:03:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0WXUeO6BdKqsBbf+LCr8UYJRNPPxWXAQjoGpUYgVg69j/2DeL9O95+vuYYyPKqnjl/oaiy8vTfAh0xuKg2NxfYqCMDx8E5N90iaKe918X/fNTB2OinIKcX3SYAOUJE6yD2HXmb3SVZ9cSUNmPDYOdoQfLazNRztVIZntOuSzZ87lD/WALevz5J570y1rbKEvbeh34dPmMc+Yfvw6a10u56qBW2QaorrbjaGvB0Ed9HjSxXDk7znimraGCKZ4LaaxiRiJXmZ7yQedjd7R00QWaPYcLqJek4S+1TbAjnVWa5NbKy277npDwz4v3lXev+BVsvlDz3jgYn9ixSWAldxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXLQy59K33YzGAiruOwLhXZQ+40Nixj6U4QkVwit73Q=;
 b=QmZ9XKlCV1IXZswLueSEMmX1nGARSGMGzdgQwK/FTYAqsByltEfSheXJW/HyD4Qb+vQgXFqyfRnOa9CWexYO33rQsPf4bGEw8Ba0S7NEuEBZMiodcplXG+LogvMXKSsmPkfgn8d0vvr2sOkuQG2nIFb2v52bBpdXaCWWqRZ3OBgywkslDWjBHCQOh7drd0rWFnuUjCi5KD8TonCG0Eme8LYy13LYrYpPciFssr7pWqVV/JNkV6FcYW4C7gkZGy4zC0T0B5ms6jGWwwRoqdeVcHeBPvtxSXUy1+uHoZYkT9Ylrhq3Hq0JVBi2wyzSuWIiWynfZp0auXjugOxULr4zSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW2PR02MB3899.namprd02.prod.outlook.com (2603:10b6:907:3::30)
 by BY5PR02MB6372.namprd02.prod.outlook.com (2603:10b6:a03:1fb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 14:03:32 +0000
Received: from MW2PR02MB3899.namprd02.prod.outlook.com
 ([fe80::d163:1cf6:9fda:4b82]) by MW2PR02MB3899.namprd02.prod.outlook.com
 ([fe80::d163:1cf6:9fda:4b82%4]) with mapi id 15.20.5123.019; Fri, 1 Apr 2022
 14:03:32 +0000
From: "Nagarajan Maran (QUIC)" <quic_nmaran@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, "Nagarajan Maran (QUIC)"
 <quic_nmaran@quicinc.com>
CC: Johannes Berg <johannes@sipsolutions.net>, "ath11k@lists.infradead.org"
 <ath11k@lists.infradead.org>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
Thread-Topic: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
Thread-Index: AQHYRNFW+lpV0OMIdUmEcCGwKggX46zZTwVggACKIAD//9fRsIAA3TrqgACKEYA=
Date: Fri, 1 Apr 2022 14:03:32 +0000
Message-ID: <MW2PR02MB3899DD642EEB00007034D0ACEDE09@MW2PR02MB3899.namprd02.prod.outlook.com>
References: <20220331073110.3846-1-quic_nmaran@quicinc.com>
 <87sfqyv1td.fsf@kernel.org>
 <2f25bb87e665488b30f6fdaa5877ad8b5b19da0a.camel@sipsolutions.net>
 <MW2PR02MB3899E0AF9C08EDF0F9CE1E52EDE19@MW2PR02MB3899.namprd02.prod.outlook.com>
 <87mth5uzhy.fsf@kernel.org>
In-Reply-To: <87mth5uzhy.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73cee869-7d0c-4c4c-d191-08da13e86833
x-ms-traffictypediagnostic: BY5PR02MB6372:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR02MB63728B847C6576D058DB19BF91E09@BY5PR02MB6372.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +SmdhlDJlK5+iqW0wYktaV8oOG5jEU8Ht2zypRR1hwjBGyK7siutvHUfo5wnn2XmTt/znQEUOcLL84YSwKMaVNizzAzmyabDEyoIuxENB5trXzXAQ5fALL/1bEjtpXNCSfqzALjxsgHlMO2TwNYjzA7fgzdYM/MQdkHz2QorpGt6XzlBY2PyLL0gE+4PXajOJxvmbf7X/hbPfrYbyMofl0Pp5gMNI9fCPTjqfnVzSkU4wLR70eNPolUrtuTpXx6aqwZQuTyruGHDhm+BgDRvP38vdYzm50dD4IgL9z+XtN3hv28d+2sjVvkuaCRUBLzJpDQE3q98L9Y5zshoThI4BAByrH+KL0sEy103/dp0C670BsRZUyIdBQwAZTTz0R+xFsF9x5K5w5ze8eKVehcq17oJeA1VBHojD63NBviMJ/JfrEztsJoof6YuL6ic6q6Z4tLtQNyxzmpFi/GV44TpnCJ7U8n6d+WBAnwy4PhNI37a+Hhk74gw+Qow7YyB5uyhDTgXXkmzCV0mq20GgcM7rPKW+0MqQiUxc0m0R6ZyaM6kMANlVqsheS++qquo0aDAGLtFUsNzsu1W6hYHtZaZw9nxO1E6p+Zzybfq3uKktzC08bNxstI2DEvKpUtkVgair3iDHQTKr2/i4xrExfYU1PvB7EjdTeuOmiuqh77mFdmN2SmmuVfeJT194ShhcJNA1NeCTIBHRnHSogL3rN7j1KLuLBW7tuBexfkaifCzsoHk8rJQ4tvg38SEAnc5Gzv9pbPgVLZ66jHMsGCcj+oVFph7FmEpS7ube5Nq9HsHVuvW1ZdQYd6Pen3Tfhb1h+MgnZhzNG383si4kLZ5lqbxZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3899.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(76116006)(66946007)(33656002)(64756008)(66446008)(4326008)(8676002)(66476007)(66556008)(316002)(83380400001)(55016003)(508600001)(186003)(26005)(7696005)(86362001)(8936002)(52536014)(9686003)(2906002)(53546011)(6506007)(966005)(71200400001)(122000001)(54906003)(5660300002)(38100700002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kO3dbEMJ6s6CVzBpBPdiUBvcfmVZfcldm/csVqMOvsnJxxzjV2o1IwarHwWS?=
 =?us-ascii?Q?qVJAIdfLpGNCInPGRWXBOZObE1SkZDqXzhZOq0RfMaBP3N8j7I+idi5st461?=
 =?us-ascii?Q?WC57QJGLrm8DiW94TuOwzO1Bx3154gtbMOL8SMkIOarw0l331xL0a6RTGP4d?=
 =?us-ascii?Q?SXAh2t6v8oN3QM/gr72bb1sOsIVB5yuPsycLKGnM/pxiFFygHeZf5JHqPKz4?=
 =?us-ascii?Q?YmdkuCQhHA47xbybCVlRhav2vPIreRjlgC7L0BwhVK5rrXgQRSKl5Codti0N?=
 =?us-ascii?Q?jCv8D+ZtcTRmTCbzny8kKY5DSUKM0j6uAhU0IYMcas15dhAI5ogMXuePRbWO?=
 =?us-ascii?Q?okkN7/g+SQRTWZYBB80rl6xi+NrYzkmUOPoNMlNLOg3W+1XCrh1G6zobEgD0?=
 =?us-ascii?Q?KxmHnTGROSi7H4Oz5MCy/V1XmgquGOxuXTm84rgSDR6C7mbyc9fslBEvrNi9?=
 =?us-ascii?Q?20UrbaJ+fWBWeiKGp2I8nN1Fg0SU+WjNCDzMeFsl5jmbH5BvaHQbP/2W2Rfo?=
 =?us-ascii?Q?NjusSbuuXDqiJ9IAeZXSivQqTyH7MoSRZSLixVlyW4YxDOLK9TDyKbOjvkFQ?=
 =?us-ascii?Q?VJLoMCvmHecxixEplLrA7KHmRQwQ6U9HW8qLEvQmPDgLCZnYyD4jldGLZXkL?=
 =?us-ascii?Q?riAa5A3tHv+RJ7X1g5SqfGJOCVEHpSC+98gnUGdrptJNP3jiXnhs9PtmARj9?=
 =?us-ascii?Q?ZoreSoE1azmbi4a9r3xdybruvmx71rVLQHsD7SIlyUI1MCfj4R66r9PVxmdv?=
 =?us-ascii?Q?SL4M9zVUMHhhpUIumetPptrJdfgEVn9phFxrGVd5eU7smCcc3S7Avh0b6BBZ?=
 =?us-ascii?Q?Qv33csnbcGZ0x9JydBS6wyDmbLXre0nXsd4GTj0NLwUpnsGsn9Gi0uoaqjYn?=
 =?us-ascii?Q?2BFD0YGzu92p3RCqu+G6IKk7QYFeKXzvV89YzwUlT5NQYCjfvFYWqvHEMNhJ?=
 =?us-ascii?Q?oakON+WLnF4FDEeL8uYPL74J8y3vWVan9F0OTBZaGZ6vdxHLsTK7PrshXfAC?=
 =?us-ascii?Q?x0KeSO5VrjGWqS8ZBFYlAQf2eEdeM/royGuvJBqQiTvr0Hn6HNqY7ROfK/Dz?=
 =?us-ascii?Q?x1csNzrDqZ1b18mXorKSuS6jIUYy9+LRLyf/lZ/mu56YCQpDZ0nNJ83shIU5?=
 =?us-ascii?Q?PezUI79l7HN1gRDz7G0ANBY4Yfrj0s7mpuAiyMMlwBE3mZaY9TMo2ejgP7gI?=
 =?us-ascii?Q?wVvIm1PBfeR2jTZC3MpFQmIjlEz536c9BMREHzBWD01dqLfH4dZS29mUl6Hk?=
 =?us-ascii?Q?qqmIENwsSyt77SFsTdWMetkf6s2ZKWf7dt39IASubUEK+2D+pH/0GViwPefw?=
 =?us-ascii?Q?swBLtBwzwIEJCyXU+3O/ICk87DaNYF2gxz7gW2ta2whQwq0ZiYUF4phZmvV+?=
 =?us-ascii?Q?BVdh+NF6Cdh0OnDX5wTesokWqHnKx2wn8rvi3ezdAOJPgCt3Par/tk77WGQV?=
 =?us-ascii?Q?vExOm0keH6+l3AZXGtROwrGO/nvYFrG5WgnT6c5MV4O62W0L92mM03Gvbsb7?=
 =?us-ascii?Q?QtCkLu5jRwjmK4/JChDL8FmVwCJkNXhgRHT6pjK8Fgiud2kHnrc37/K19sLx?=
 =?us-ascii?Q?Ujc+KjhqVpVeuLHJdrUeXcJtYsJ93QHXn/CXxXM74T+LUghZ0rZuCygimKG4?=
 =?us-ascii?Q?wEw+a/YwLD+4czqmus2rxNDxtHNMZtqYvHTQsbk+LOfnexXfHLR3K5xSBmnS?=
 =?us-ascii?Q?BFBgDhAk4Ubd1v1tNdiUGqeHcVmpymVFaXAugJx58dqYf3PIVT6QwwvJvMF6?=
 =?us-ascii?Q?8HP36tjlCA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3899.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cee869-7d0c-4c4c-d191-08da13e86833
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 14:03:32.6975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2uzsLF2kBdMIX5PK5HXgTZNtHnztkhfxrt/62keVm4yicdCFr3VtUEnXn3jIOVd2cL4pzN6mdxuBCq+b99Imbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_070341_832401_CA76C1CB 
X-CRM114-Status: GOOD (  11.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

-----Original Message-----
From: Kalle Valo <kvalo@kernel.org> 
Sent: Friday, April 1, 2022 11:17 AM
To: Nagarajan Maran (QUIC) <quic_nmaran@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>; ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure with WoW unsupported hw

"Nagarajan Maran (QUIC)" <quic_nmaran@quicinc.com> writes:

> -----Original Message-----
> From: Johannes Berg <johannes@sipsolutions.net>
> Sent: Thursday, March 31, 2022 5:29 PM
> To: Kalle Valo <kvalo@kernel.org>; Nagarajan Maran (QUIC) 
> <quic_nmaran@quicinc.com>
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
> Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure 
> with WoW unsupported hw
>
> On Thu, 2022-03-31 at 13:44 +0300, Kalle Valo wrote:
>> > 
>> > Fixes: ba9177fcef21 ("Add basic WoW functionalities")
>> 
>> Fixes tag is wrong, it should be:
>> 
>> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
>> 
>
> $ git config --global --add alias.fixes 'show -q --format=fixes'
> $ git config --global --add pretty.fixes 'Fixes: %h ("%s")'
> $ git config --global --add core.abbrev 12 $ git fixes ba9177fcef21
> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
>
> :)
>
> Johannes
>
> Thank you for the commands.

> Please use '> ' in your quotation, otherwise your replies are hard to read. See item 5 here:

> http://www.infradead.org/~dwmw2/email.html

Sure Kalle, thanks for sharing.
-Nagarajan.M

> --
> https://patchwork.kernel.org/project/linux-wireless/list/

> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
