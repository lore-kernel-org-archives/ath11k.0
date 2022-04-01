Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C53C433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyFcPiMFL8E+9ER+pURfIFMqzzOLEk60OJAjcDWxog8=; b=A07SA/jiHSVEAe
	x0MmHVDBquM6+anFpVGxszPniGTvCqMYs4GFKLtknBzu4QTnMdB+E+RHfvYhkz8fekWMf4DewGu29
	Y8YA9rkSjGEPECyHqSq3pXzVspIizn4svxhuHkU0LJD+FAXQUMTf743S7Z2znCiXFpLWywBi2CFgi
	qxJ3IwqgDBnmvbK0xRhdMeRAN4Ugd/Y1TrAIPuNmuYg6jaLoxsm/lQLT+rJeAgB1vX2WaolcQUBZ1
	33sOYoSiH6ClmjnRlWn5GCu5UnOmYdLCH9SCiFmdetqyRBdigEmTwWFYSYCkg71GB2JpayXehPqrU
	zq96WthXHYeK5tKV89yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naHu1-005tii-LE; Fri, 01 Apr 2022 14:05:25 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naHtz-005ti7-8L
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 14:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1648821923; x=1649426723;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gyaLUaML0fCsGmiRXyEKsZr5hwOZXsvDU029KN0cBtc=;
 b=yORQECjKC/t9HhA2fVaWMAgYuzExMyYkw5fxPGqjxKHOKv2xsLufGLvw
 J84bhSkoaDrjz9gicHvIxbJtT10gP6qP0mIagmZnvMpXGPpR6Gr3Fl9qk
 87R2IxtHzdnscor6S4Gdc/boEw00ovLNmgHGSXZTzKTf+Q++/sz0x9Fpa w=;
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 14:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/XHa+yQQ0tnJ38tQRLIXHAoOc+CjO82dF5rpYHdckois56EM3mwYFCutBdJ9w7jEHQEiAqCshZsAvUCiYa5Qd4YeIihj0zwoc/1tajw2iHf0S3VtrFl6fBjHeQ+w/VraX9HcNkmq4Jm150/5sZPWacqgVXgInqYjWyiEt+EuYwKs4CG5QyCAHLAkJ28IB/R/8oJIJDLTiqP703ndz2h9YJffPuvzm2XO0Q4W1wbcWJwiKK6FJnqJBk2jR9T5S/MkzfSZPAyJtAHsr7ZoveKDgLgi01R9dce0taP6+KHcG0iovAUc1s30NSqTuwotSFxqx31A0ZeOgLWWCKxd/bUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyaLUaML0fCsGmiRXyEKsZr5hwOZXsvDU029KN0cBtc=;
 b=nv6VLOKZsXjJvloI5tYrNAn1dYe8tv0PImRRDhOwsErNfotWi8zIRhYKLiglXR0/tWaEnbUOm8yriH21Y/sQdZGeMVqCAGH6OpvOCgvjvtViLWHeST3mSGiS2717b5ZiWduZx4tuNAN4I5LLHV2zdhCyzVelrO/E2KAT9HX/MfL1iKz0BEyFBRkQq7kbg9QT3cAfq6VWj26d1sKcLFDDcOEK0qaE8Pkw9G6im9Rdli8KQfkXJi1iwSYdntSzdhMo4R2ZPjXcDC3+Btzd5gFn87ZFDjKJlT6Ejvf8h2Yxb4vMen5TOAsUWnmvy6xnaG85AnP+qED7cTjOc6M7k2T2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW2PR02MB3899.namprd02.prod.outlook.com (2603:10b6:907:3::30)
 by BY5PR02MB6372.namprd02.prod.outlook.com (2603:10b6:a03:1fb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 14:05:18 +0000
Received: from MW2PR02MB3899.namprd02.prod.outlook.com
 ([fe80::d163:1cf6:9fda:4b82]) by MW2PR02MB3899.namprd02.prod.outlook.com
 ([fe80::d163:1cf6:9fda:4b82%4]) with mapi id 15.20.5123.019; Fri, 1 Apr 2022
 14:05:18 +0000
From: "Nagarajan Maran (QUIC)" <quic_nmaran@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Nagarajan
 Maran (QUIC)" <quic_nmaran@quicinc.com>
Subject: RE: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
Thread-Topic: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
Thread-Index: AQHYRNFW+lpV0OMIdUmEcCGwKggX46zbaWMA//+vjQA=
Date: Fri, 1 Apr 2022 14:05:17 +0000
Message-ID: <MW2PR02MB3899523D4B643CCD0E4AFA2DEDE09@MW2PR02MB3899.namprd02.prod.outlook.com>
References: <20220331073110.3846-1-quic_nmaran@quicinc.com>
 <164881389362.6665.5091759680024849832.kvalo@kernel.org>
In-Reply-To: <164881389362.6665.5091759680024849832.kvalo@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88c7e52b-e831-43e4-afe4-08da13e8a6f5
x-ms-traffictypediagnostic: BY5PR02MB6372:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR02MB6372C393CFEE97E5A729A8DC91E09@BY5PR02MB6372.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZUdLfHm2dc04k+aUuaWdH/Ww+jkT4cE8ztMtIRdgja6vq4Bn2p3XKYbUnE1b8HbJwd7ejOAj9UR3TRsczU6f1Hmm4yEVteAAHmGDeahMNHM7tlOlZIy7ANtqpJSt3pyMhG14fw3oh6g5cAGFCBxNwkpNALDEILegLevMg7RL/Dzi51UpYGs8G4Nj3FHPzm7dIkI/8dZk4J+3Q/w0V2CYhUswXIqPpKvLTDtARKgMczVx7s09MdQIpu7vADmHZtexBKk2+0l/WflAZy8HcQRpGe9A6Jzk1UpfM3bGRqQMv2ShAweLDEwLLAZ8Mzgy+jjUvW/KYQta5E4d1uSxvP2N0MVJEj/Oj+Qcyza8eEOfXDxsG43LDy1ARbWpxGtjCIrBMCYpTFbEypmZlIU/XcvkA/UIMsJZkg8BaE10Nwr4jWQ+TLdspbQLa8m/0Gl6/mDqRFiwVeWLSyZj0k3X5ZZ6RZ06rpGeVgsn9Sgq5zMwN59yVEU3RhX2CihtV1qHgA6wLvMXzcrzQLIrdPeDE/nwNQOArGCrmdGnaQ4BrbAElwuL4JLyWromlepb9O0N3oNeaPfJ0iJoOfloqXQCqjvA4w3LbuVX1cq9W3Jp+t7TgwurBf6FNfjThyccMQIQynVWrNGsOeViAC8W0HOusLo/Wag83a1P1FCcpFqKL5NMONY6YPrqKE3FEB8OxHoy6KTlRWeISnqpCOTUypU3fPKdie1zc0o/8HiykzzJNRWJC3CHvtz47/qlkEpKwB5A5E4MO48846TovNeAQvbYsMzRcbQlvOE8zv8GstZGbsfvRkJ1TwhnR7j8rYCK+vFYHJj6tkkJvAuOz2qRuDlZODSt1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3899.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(76116006)(66946007)(33656002)(64756008)(66446008)(4326008)(8676002)(66476007)(66556008)(316002)(83380400001)(55016003)(508600001)(186003)(26005)(7696005)(107886003)(86362001)(8936002)(52536014)(9686003)(2906002)(53546011)(6506007)(966005)(71200400001)(122000001)(45080400002)(54906003)(5660300002)(38100700002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEFnVWxBRVFLS2JJNGF3YitVdnI0MGxkTlV6UVU2YWRWUWE2TVA1eUlzbjhS?=
 =?utf-8?B?WUcySGxiSnIxWHdqZmhMelNYak9kbkpyZ3J4RnhuRUtIcjNXRXZPZzM5Zmdn?=
 =?utf-8?B?NTdUSkRhTVNMblk4bkpTM3lZV01NNlJ4bEU1YlVLNFRLK2t4OSt0VXNWNTM1?=
 =?utf-8?B?QTA1Vi9WdEdUY3pKc2w0a2gzTXY5cyt4NXFEQktxd0FNU2Y2dU16U1pyR0xK?=
 =?utf-8?B?MCtEa3MvZW9WRE5iUjg1VG01a1ZhMXdxb1ZHekQxRi9KYllENjNhMC81enAr?=
 =?utf-8?B?YWRyR3QxWHJuUUtncnhXZE5aMmVLSUoyZjYrcG53U3M4aldOekk4NVZGU1RM?=
 =?utf-8?B?ZklGS0N5Mm13NWZ6Sk9uKzYyeGh3cEx6NFVjRzh6ODFpdE1ZTXhkQ0M5V2M2?=
 =?utf-8?B?em1YWERtSURWUzRsOXFIaWhKbGY4UnJUdFY3VzM0enhma1hvQnl6c1pNYnF4?=
 =?utf-8?B?TTBYSXVORE1scjNNRDRYaHorSktucC9FZTlaZ0gvTXhRbHNDa3BBNGV0dzJn?=
 =?utf-8?B?WGFXV1dxSTFNRzBwRmhXUFR6d1RGM3UxdkJZTExkZ0pJSlZyQmorajRzYUhm?=
 =?utf-8?B?OWFuanppdjBPV3crSGEzUUJuYXJkOUZGRU02RHh0SDVXT1BRUTFxZkdzbmRs?=
 =?utf-8?B?WTd5cXhPL05ldXVxdDJsK2c2dktJT1NVcllMWU5pR2R4VlNxSUdMbHBNaDRk?=
 =?utf-8?B?SE5LOVE4aDFLNkxIaFprdmE4aldMd1lvTXJidXBzaEZIZFBPcmJtOUsrblo4?=
 =?utf-8?B?Qk1KdmhSSGtSem1GNmJxTTQrbVU5RW1qSlE1endiNFZqMGpMbkNrUjBDTzdH?=
 =?utf-8?B?OFdmQ1U4K3k0WGlPZnA1LzY4ZkRBTG9lRjh0R1ZNbWJoeklERmdHSDhha1hE?=
 =?utf-8?B?Q2Yza1FVSjk0djM3YUJRT1BEUW9RRGtSWjFwOG9Bb1JBWE9PMVVvUWZ6NEJp?=
 =?utf-8?B?SGszVzlxampsb3VkWHVEdkV2cDNLNVNqTU8vNStDRDJCcmYxcDRDM3oyUHRH?=
 =?utf-8?B?TWZCUjc0eXM2YUQwdTdTTnlwWlJyMldDZHZuL3dnblRiU3NLeGEzVFI4TWxt?=
 =?utf-8?B?MFl6ZTZyaVFtTXk1ZW1xVWo0OXlidjNBL3VRKzUzckNrVHdmTW9jQ2pyaVN3?=
 =?utf-8?B?OHFuVXBkc0d3bU5KeDJYZDlEWkN6dTVQeHpTbEZ0cWVsdU5sOEdZQ293RWJm?=
 =?utf-8?B?cGtLYmlpYUtkWHZMRlQwS2xpV2tLSDZ6Sk9SdVhSdS9hbTVnaWhOWi93OGhs?=
 =?utf-8?B?VklCcVdKVmVpdStEendJVmQ1aXJHSzFsM0lyZUU3akpWZ0JwUVIyME00Q3Z0?=
 =?utf-8?B?TTBwSGhUemgyS21zWlo0aDVYUFkxOFhuRlc5RytXa2dqOHBQNGZDMUUrYTFR?=
 =?utf-8?B?U0dJNGhXOFNDZDIwUE0vUjVSWDFHbWJUckl4VGtnYXhFbXZJL2FCNzl2R3dz?=
 =?utf-8?B?YjFvYXhEcjNjUlVQWGRrdHhzUzNHM2poYktNZWVkRlRubHN2ODYzQ3VGSm5y?=
 =?utf-8?B?N1RVc3JLaEVETUR6ME83SEY0a1dMcGI0dm1kVjhwRGxmMm5WWjJBSmMyK0RD?=
 =?utf-8?B?L3R5Ylo1ZGZrd05LMldFaWgxRkFIRDhYU1BMNDdiL0NKZWlEb2ZMYUV6MGda?=
 =?utf-8?B?S01IWGMxbXE2LzZYVXh0THpUeHRvakMvZkNJWVV0QjFDOU5IK0dzZDZEOTNL?=
 =?utf-8?B?YjUzdmFwUXE5bTF2aThUOHdPcDVhK3JpcllDdElwNTI2ZWQ3NDdVdFJqQzhD?=
 =?utf-8?B?dktaU3hsNnlDQVZjem9SQ0c3NThxVWdHMVlSYUNxc0JGMTRTN21IVDlPOXF0?=
 =?utf-8?B?eGNTOFhGRmpaWDN5Q1dwWjJramlTaEVnQ2MrT1JSbXpOY3NPOWk0cm1yZEZD?=
 =?utf-8?B?STkwZ0JTc3JqSEppcXhET0Y2VTdpVnhybWFXVlFwcnozb1FpRkpXUFFXaWhj?=
 =?utf-8?B?SC9vT3NwSTE1QzVwV0U0Ulk4a1ErS2dWa2N5OFlxK0piellqd1U5SjlYQ3BM?=
 =?utf-8?B?QUJPN3BZT0R3dG9DUXhjZXhUYUdZTzAyMVRXdUZlL2xYU1NERXZLNTJMWGdo?=
 =?utf-8?B?RWRNdnBuL3g3cGZVMmlwUi9yZmZMTVovVGRQMkJHanlFaGJHNjg5NFVFVlRQ?=
 =?utf-8?B?S01IKzgrbmpCcGxYSEcwUThoVklZL05SQzEzMmVzS0o4d3psL1NaQ0F6RTZX?=
 =?utf-8?B?TUxPbi80SmNMTEtRbzVjeXI4aEdEeUwvS3RBZjZuNDRZTmRhSUQ3SXdLcEZy?=
 =?utf-8?B?RHZBR0ZuUUJ2R0FpRFRDWStLQzR1djQ3OEd0VXE5VitpY3p5MVM3UFd6c2p0?=
 =?utf-8?B?UGp4cklQU3lyMk9kVmJCZXFtcW9hZ0RJbFpiZzdSOU5CL2RFdVBtZz09?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3899.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c7e52b-e831-43e4-afe4-08da13e8a6f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 14:05:17.9868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYApdY9tAcZkdEC7iN+wKy3sXKomU92PYC4QahLgQ77csYl3+5EuwycveK7tma/PJjXRylo7kUyv9pdNfgYvjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_070523_404660_E2345C8B 
X-CRM114-Status: GOOD (  12.58  )
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
Sent: Friday, April 1, 2022 5:22 PM
To: Nagarajan Maran (QUIC) <quic_nmaran@quicinc.com>
Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org; Nagarajan Maran (QUIC) <quic_nmaran@quicinc.com>
Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure with WoW unsupported hw

Nagarajan Maran <quic_nmaran@quicinc.com> wrote:

> In the "ath11k_wow_init", error value "EINVAL" is returned when the 
> check for firmware support of WoW feature fails, which in turn stops 
> the driver initialization.
> 
> Warning message:
> [   31.040144] ------------[ cut here ]------------
> [   31.040185] WARNING: CPU: 1 PID: 51 at drivers/net/wireless/ath/ath11k/wow.c:813 ath11k_wow_init+0xc8/0x13a8 [ath11k]
> [   31.043846] Modules linked in: ath11k_pci ath11k qmi_helpers
> [   31.054341] CPU: 1 PID: 51 Comm: kworker/u8:1 Tainted: G        W    5.17.0-wt-ath-594817-ga7f6aa925cf8-dirty #17
> [   31.060078] Hardware name: Qualcomm Technologies, Inc. IPQ8074/AP-HK10-C2 (DT)
> [   31.070578] Workqueue: ath11k_qmi_driver_event ath11k_qmi_driver_event_work [ath11k]
> [   31.077782] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   31.085676] pc : ath11k_wow_init+0xc8/0x13a8 [ath11k]
> [   31.092359] lr : ath11k_mac_register+0x548/0xb98 [ath11k]
> [   31.097567] sp : ffff80000aa13c40
> [   31.102944] x29: ffff80000aa13c40 x28: ffff800009184390 x27: ffff000002959f20
> [   31.106251] x26: ffff000002828000 x25: ffff000002830000 x24: ffff000002830000
> [   31.113369] x23: ffff000002820000 x22: ffff00000282854c x21: 0000000000000000
> [   31.120487] x20: ffff00000295cf20 x19: ffff000002828540 x18: 0000000000000031
> [   31.127605] x17: 0000000000000004 x16: ffff0000028285fc x15: ffff00000295b040
> [   31.134723] x14: 0000000000000067 x13: ffff00000282859c x12: 000000000000000d
> [   31.141840] x11: 0000000000000018 x10: 0000000000000004 x9 : 0000000000000000
> [   31.148959] x8 : ffff00000289d680 x7 : 0000000000000000 x6 : 000000000000003f
> [   31.156077] x5 : 0000000000000040 x4 : 0000000000000000 x3 : ffff000002820968
> [   31.163196] x2 : 0000000000000080 x1 : 0080008af9981779 x0 : ffff000002959f20
> [   31.170314] Call trace:
> [   31.177421]  ath11k_wow_init+0xc8/0x13a8 [ath11k]
> [   31.179684]  ath11k_core_qmi_firmware_ready+0x430/0x5e0 [ath11k]
> [   31.184548]  ath11k_qmi_driver_event_work+0x16c/0x4f8 [ath11k]
> [   31.190623]  process_one_work+0x134/0x350
> [   31.196262]  worker_thread+0x12c/0x450
> [   31.200340]  kthread+0xf4/0x110
> [   31.203986]  ret_from_fork+0x10/0x20
> [   31.207026] ---[ end trace 0000000000000000 ]---
> [   31.210894] ath11k_pci 0000:01:00.0: failed to init wow: -22
> [   31.215467] ath11k_pci 0000:01:00.0: failed register the radio with mac80211: -22
> [   31.221117] ath11k_pci 0000:01:00.0: failed to create pdev core: -22
> 
> Fix this by returning value "0" when FW doesn't support WoW to allow 
> driver to proceed with initialize sequence and also remove the 
> unnecessary "WARN_ON".
> 
> 
> Tested-on: QCN9074 hw1.0 PCI 
> WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
> Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

> Even though I asked you to mark this for v5.18, I now realised that commit
> ba9177fcef21 is only in ath-next. So I'll apply this to ath-next as well.

Sure Kalle, thanks for sharing.
- Nagarajan.M
> --
> https://patchwork.kernel.org/project/linux-wireless/patch/20220331073110.3846-1-quic_nmaran@quicinc.com/

> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
