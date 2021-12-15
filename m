Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ECFC433EF
	for <ath11k@archiver.kernel.org>; Wed, 15 Dec 2021 03:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVfs3caiqDcrC+b89ka0KrBXF1kfWya4XMp55rxzlxk=; b=pNvEPH+zG4CohQ
	GxxkBxP2eyP8XgQuBe8OT8G4POi2NVCEYl8JGq7zM8oS4zPUmgFLKMjuD0JG9kGLw3687xeQsIedg
	ghwUPXyrh+HpMo4LugeCpezYLBDCpclrOdBMt88gmAcMCVMfQ8V7PKIw1GKVnK8HTcqIbjMVnxsI0
	E6STAeRI8f9Fc7ArgefVLXTYNgrNTYMoUM3NL0c45YIrJ7keWnseG7x+N3qZYSGWlq9rw+lYU5zv8
	mYUd+ix8EKzyK07gGo7fPkDPyWWgLDoStPZLASo80AEx76cKxCoHgizGB9p+TVUMO0+oriwUC9lK0
	f5+8bDK2tLRvR3z1EKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxKYj-00GUUY-Vt; Wed, 15 Dec 2021 03:02:26 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxKYg-00GUU9-P5
 for ath11k@lists.infradead.org; Wed, 15 Dec 2021 03:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1639537342; x=1640142142;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1jFepgGZ0V/gZoGqAxXxauCExxOWFBexce7gdd7YnhE=;
 b=NeRg5rUC3zWv9+ynL6uFuTF7Vb3jTdYe+UhIG73/hwWevS6OAjxnDlWF
 5nPPAU02++PMogXLLswDrBz0BKqaeMvVOkDZkMkYpCv57gAb3Kfr7Q/AX
 a4laIfgISiEClAzrd0zmlK0ge4n2um8T6xO+Yg3bwDZsbYI6nwdQQwJyr I=;
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 03:02:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io4kJrWEZvjQWLLH2mOSYnRyd9MHMhDnZfjsypO7AQJM0BrDaOaUutBjV1StvQJzzqEpa8hYT6F0kKZXbr+f9kro5q552wU1OYv6ifaGZQriQziNSZfpTpGhN0dK+jiLza59fcbjhjdJJ2ZHcn/AMv3xFe0Wh7qmwJ4OlL1B2DOcPFuxqNU5ArLfKlHkuxcQv5+SlqUKFd4k4gdHwEs/9/I1kP9BaMjxzyiYR8MdgUNvgu3MGRsiU7Ryy0sh8hdpBh62yPaer1hI6s4Fv63uKy+VKbhHtw+xmXG9mr2UGryEjRrqbEq35LpZN/YB8KYzJZMy0rpmbKFYNjH0tsjwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jFepgGZ0V/gZoGqAxXxauCExxOWFBexce7gdd7YnhE=;
 b=oWaBHmMuuxDUdk0CawGdF3Q/Bzzhqba3lYjgzbjj0EUhipTWv1s0uJwqxSVoiemD0yo5+VYOHHklk7CrBQdjYcFZhn4NJK/J9BhsTj3WuSOvTLP1gdQfgl8Hs7vV2gpu/BY8gPQ4HNlyKXWbRDlkRhii1cZp8YLS5Y9GhMPhvYNsbdxgFSNZyA1MspHuofhI6EIWsIRk4/Gp6gMdNoiVRRmkUlwRkTE1wtLkrCIqWhBquEaUJrdfn6o3B2cLrASuoHHQxE7ZmnYou8T2q49eY2hCrqNAJAGESiuDOtZQMm4Dz9sO97fa3Zi38PpAs7OGKGKQcqRyT5rCeyaR6G39yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DM6PR02MB6924.namprd02.prod.outlook.com (2603:10b6:5:25f::7) by
 DM5PR02MB2681.namprd02.prod.outlook.com (2603:10b6:3:10b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Wed, 15 Dec 2021 03:02:16 +0000
Received: from DM6PR02MB6924.namprd02.prod.outlook.com
 ([fe80::f4:daa2:14d4:d825]) by DM6PR02MB6924.namprd02.prod.outlook.com
 ([fe80::f4:daa2:14d4:d825%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 03:02:16 +0000
From: Chun Wu <chunwu@qti.qualcomm.com>
To: "Wen Gong (QUIC)" <quic_wgong@quicinc.com>, Sven Eckelmann
 <sven@narfation.org>, "ath11k@lists.infradead.org"
 <ath11k@lists.infradead.org>
Subject: RE: ath11k: firmware variants for WCN6855 v2
Thread-Topic: ath11k: firmware variants for WCN6855 v2
Thread-Index: AQHX8V3/LjbHy0fhO0mzUbtbc+pDhqwy3SAA
Date: Wed, 15 Dec 2021 03:02:16 +0000
Message-ID: <DM6PR02MB69248F37B55ACCC868F8B82BE0769@DM6PR02MB6924.namprd02.prod.outlook.com>
References: <3348649.btbF5x2DtX@ripper>
 <a02c79da-17da-9b9a-6c09-1cd7b6696427@quicinc.com>
In-Reply-To: <a02c79da-17da-9b9a-6c09-1cd7b6696427@quicinc.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70db1990-b496-418d-cec7-08d9bf774d44
x-ms-traffictypediagnostic: DM5PR02MB2681:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR02MB26816E34588CAC9810E34525E0769@DM5PR02MB2681.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Jul4s7DdUKsTtA0FdbWiOB+IhbIu+Iv7LoThxaM0KNP9UBlb7VsT2hEXvwO2C8r9JIf8jYN7Nz4lMWmI0Rgqu2YL3zsMnnF8I/EG440Jhm1B2ckMhFY4UQGlvuTXEQgPszS3zvyI58OfS+5Z4xrJU+LHbQoGceKJhYiTa3N1gPNEl++5b8s4892ViMoDgkvgslhWlQ7+lwEhEKw7SRF0pcLSLqx93r+rmUdsPaZKh+pvQAU0VNQcrER0+QZqO/qTkeUdM3hsQApSUVWShZCYPqCTMY9CKoL8JmTc40+43Z/UYYYghhP5S3cAeOfIiOP5NLR+ypHE3nRYsiMDnCdB5/yXjwLWC+6q3IHxZ2IiG0mJPIXD2MfxSxurd8YPII22lx3+zDzc9a4mWSTDDIUqNFK5C225DgkbLU1vlOGVEfqDUjnaVWpoAE3B+bI+hUv6SY7VXDTLLwUHtKSEHeBF/FxgAn5FvcFc/IipRd6oqmg52YwTJwAukendZnT0tnTFPfXWheHDnoxmazw03Shtwbr20fcIPs5oe+gu89i/ZkayAAvKMCHLgyo7G8Ss0jv+Kn1qfcVU5Frtn4SH/o9QZeqC3FHUiNIfS0iqPEvmmeoT2r7uwe7l71cFdJ1Sr8mg3EYqwceC+AC8AgkrVc1ptxOuZ5dxsOqm+QgxFpWcR95d9XfVvaVEdpWXt5dg91MHORUyjF72JNNn8uxjyuqVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB6924.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(316002)(52536014)(8936002)(122000001)(110136005)(8676002)(55016003)(38100700002)(186003)(9686003)(4001150100001)(71200400001)(508600001)(5660300002)(6506007)(2906002)(53546011)(66476007)(7696005)(26005)(76116006)(83380400001)(66446008)(38070700005)(66946007)(66556008)(33656002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OCtMSTRHR01EOWIyNmF2KzhvM0g5RThoKzNxNnVtZWZQaGpzOEV1Y1dmK0RK?=
 =?utf-8?B?eFcyMEJjMGppRW5zenozOHViT08zSUxuRlduM0xuU3MwaEcyQitwa2I4UzJm?=
 =?utf-8?B?MVpkTTI5aTNWa3RyclJKY2J4ZFBNQzFpVnMyMUVNNnhNaW1NUVN1SGxRU1M1?=
 =?utf-8?B?c25aeEtrUGxsM2U2bTNsNExJaU53VnZLSm5hZmxtQlB2N2JaSTE5OU1QTGc5?=
 =?utf-8?B?K2xST3NLWkc1RjZTVS9GL1F1ZWl1bXpkTEQySnlwcUZjeklLdGZrTFVURGRG?=
 =?utf-8?B?MTFnbG5vSmlmMXhqTXNvVVoydnN1U3ZnU0x3QmlwK2R1Ky9zUjgrNGlrbjNs?=
 =?utf-8?B?bEMvaXVCcUZVOGZHVVlRY3RqeklPd0VoZFIvc1JkeWFoWFVYL2F4ZkUvUTU0?=
 =?utf-8?B?SFJhaURlaW5ScExNS3FjQmN5SlRaSzFrWFJlR0tiS29RTytnU2R4WGlSSysx?=
 =?utf-8?B?WnBURFpxSGVubzQ4NjViaGdoTFBBVW1tNUVTazlGTlJkcnZjR2FnK0NmWEY3?=
 =?utf-8?B?eXhEd0xucVhEemNjQXA0LzFsYmJ5aE5DM1RyWWFONzd0amJUVkNXSTdJdTl3?=
 =?utf-8?B?UkhHbW1ZQlg4cTdnL1BOT1l3K0FTWndXTW9rb1R5N2EvMWx2OUo2aFlrVlIz?=
 =?utf-8?B?RUwwWWdBbG8ydXY0cG91NXEzNWd6NEhHRi9RNnA2TlMrV2pyQy9VdlJ6amtK?=
 =?utf-8?B?ZWxIeVpYTE9iKzV4dWJjVW5CRVVZdmsvb1dDRmZRUGZUSCs3TldwZXY4dUdV?=
 =?utf-8?B?YTBFWDdYZ1V6dmllcmxjbkl2VHowbVhyQ21lOGtlMzJLaERhclhVZ3BmOExz?=
 =?utf-8?B?OVdlbFhpTmVIU0hhYXE4aytwKzN0b3Nldk9neWYrb0RPT1lNMitZUXZXSjJD?=
 =?utf-8?B?djM5ek9WMHlLa1NyQW5HdjZLcU93MVJCRWw4clAvaVNIcFBpRXNUUWg1djZi?=
 =?utf-8?B?RWRTNTZiNERZMVJIVGdXRy9XVjdlNlJLZFBEdzQyeFF1N2U3SHZodXhTWHRp?=
 =?utf-8?B?QkVyVGYxekVYYXpvYVFoTTh6SGdpa09oTGhCYTU0M3F5NkFrbW5IaU43dTZy?=
 =?utf-8?B?M0FqaG91RFlpcVNiY1RvNlZucGpvejZaNTcxL2kyaU81aVQ0TXgzQzUzaDkr?=
 =?utf-8?B?Umc4Y1FoMVdTUVBodVZJR3J2UHB4QTgyM2FTWkU2bDg1NGdjRFJyaFFqK1d5?=
 =?utf-8?B?a0ErRExMVktOQXM4SitEUWJrVXFPSk00OEJLRzRwZVZLT1MzQllzN1lBanha?=
 =?utf-8?B?UUVMT0JUekl3aFRDWmYrSFN3ajhWM2VuUG1JZTZPTTFOSVF5RERBbFoxTG00?=
 =?utf-8?B?ZmRtb0VaUXNwQjUvV1pNVEFEbUNjR3RHeFZlZ1VPdlU3ZXZwSVVKSzRlTysx?=
 =?utf-8?B?T0lUS0E3ekU4d2UwdTBaM1EweUtkNlo0K0QvVysvc0E2ZDhQenNaOFYvWkxG?=
 =?utf-8?B?NDR5ZmEvT3Q2clk3SkNkcGtCeWRJR1IwOXFaU1piUXFqS09tYTVVMDFBTmtj?=
 =?utf-8?B?bDZaK3hMNGZ5Z0dLZTFxNk5xQlNiZ1VxSFpaSVJOT1VOUUtyOHNlRTNtRGsv?=
 =?utf-8?B?UVIwWlVmNDZCZWgxVjBYczhLZU9yN1BqbXFvVTRrWk5WRS9VWmhuMXpGOWhS?=
 =?utf-8?B?aWdza2ptdlkzK1draFpnR2J1MmEwSjJwTElkREhoeE1PZ2NoeHpzWHowYVBG?=
 =?utf-8?B?V3Q2emxQUC95SktGaFVqU2ZUVERlKzhHdDN4M3FjRUNtZ0Y1NmRhSkFNVmRn?=
 =?utf-8?B?ay9LVFUzbVYzanplNlQzeEovdUsxczFsYlJZaVRqaStEcGVPZzlhL2tGeW5X?=
 =?utf-8?B?M2RQTUtzSEorZTRmdEw3REVZSnBhSnVDRldwclVLb250S3FVWjBEWlNRZDJU?=
 =?utf-8?B?UEF3L2xOOEsrTFdzLy9mMDRmYStIaDlyU3VoUXFzV1JwME1ZdEt3dDVzQXpB?=
 =?utf-8?B?WFZoOWxWQ2xacUY4UjFKWTB1UFl5SWNPL2FpeFVFcTF1K2UydENONW14N2ZM?=
 =?utf-8?B?WC9ZTFRGd2FMTHBDUTF6SlphZ01KSUFWUFN0aXh4VDdEemdxcGhuclp0QXhq?=
 =?utf-8?B?R3ZscG9seWQ4M01laG5nZ3NJc0ZiSEtzOEkyM1NqODZOTUthMHNWSVlJOGRj?=
 =?utf-8?B?RnVma0JuZWl4dlllSUVNUnNYMHB3dC9UMjloQXZ3SjVDcWNVK1RFM2JrczRW?=
 =?utf-8?B?bnc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB6924.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70db1990-b496-418d-cec7-08d9bf774d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 03:02:16.7379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kz46cHXkfdg6bJFVHyXHXA31gNBUggCBxBy6wcpNeRMUgsZwsDxVDXwtTB7BUz6uv8u3Wk8xqtQZppMhN+8Owg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_190222_924983_3DE27AC6 
X-CRM114-Status: GOOD (  17.25  )
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

the special board.bin need to be signed by CE.  Fw will be crash with no signed board.bin.

-----Original Message-----
From: Wen Gong (QUIC) <quic_wgong@quicinc.com> 
Sent: Wednesday, December 15, 2021 10:47 AM
To: Sven Eckelmann <sven@narfation.org>; ath11k@lists.infradead.org; Chun Wu <chunwu@qti.qualcomm.com>
Subject: Re: ath11k: firmware variants for WCN6855 v2

On 12/14/2021 9:37 PM, Sven Eckelmann wrote:
> Hi,
>
> the EmWicon WMX7205 (Milan) seems to have a special board.bin from the 
> manufacturer. But when using it, the firmware seems to crash:
>
>      [   10.710206] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem 0xd0000000-0xd01fffff 64bit]
>      [   10.819230] ath11k_pci 0000:01:00.0: MSI vectors: 1
>      [   10.840305] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
>      [   12.234095] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id 0x400c0200
>      [   12.242991] ath11k_pci 0000:01:00.0: fw_version 0x110c0b4c fw_build_timestamp 2021-11-24 04:24 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>      [   12.271180] ath11k_pci 0000:01:00.0: qmi failed to load CAL data file:cal-pci-0000:01:00.0.bin
>      [   12.520852] ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_SYS_ERROR
>      [   22.333795] ath11k_pci 0000:01:00.0: failed to wait board file download request: -110
>      [   22.341751] ath11k_pci 0000:01:00.0: qmi failed to load bdf file
>      [   22.347921] ath11k_pci 0000:01:00.0: failed to load board data file: -110
>
> But they also provided a firmware which doesn't end with
> QCAHSPSWPL_V1_V2_SILICONZ_LITE-1 but with QCAHSPSWPL_V2_SILICONZ_CE-1. 
> This firmware doesn't seem to crash with their board.bin.
>
> Does anybody know whether the firmware QCAHSPSWPL_V2_SILICONZ_CE-1 
> (which cannot be found in Kalle's repository) is actually meant to work with ath11k?
> At least from past experience (with HK01), I know that the firmware 
> for the proprietary driver is not meant to be used for ath11k and 
> caused interesting crashes.

As I know, the firmware
WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1 has validation for the board data file.

And the special board.bin did not pass the validation, so firmware crashed.

>
> Kind regards,
> 	Sven
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
