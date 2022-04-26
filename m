Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D632C433F5
	for <ath11k@archiver.kernel.org>; Tue, 26 Apr 2022 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdBBrBI2QWLSFyhgs+Cj0eqrXPALXNEUzGlwDdyjZ38=; b=UiFmF5sQX6bIfE
	ERypA6+iQNq4EMcps32K3pLvvSb/oxlgEp9vWvbjH170dYvzbKAIu2LY01KwAADusZ4RzorwsTMsE
	7fXVeGa8CSQdu4v5lNOb2AHmP0HMv2/r4sOaP/5cMKG+05aHV0IXaw2xvt8zGfrAGrwch5omVJJg9
	ffP6kyqAnCFzYtjDY126WuF5Rtr0KeJIH0zVkNxlhVdfhKryiywwTCMLb8wv0irfVSrXz5awix/b7
	4ybT3x0PHVgaVra56xnwTESYgxTEEQLDPBVK82mePmMeYGQJhe2eaanrhAqISXGGRvy9kIzNSTh9t
	O1TzNwf4CwnRgI4HEJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njHvS-00DjaW-Qc; Tue, 26 Apr 2022 09:56:06 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njHvQ-00DjYR-3r
 for ath11k@lists.infradead.org; Tue, 26 Apr 2022 09:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650966964; x=1651571764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xbr57kMzeruIdKOocUwi1OGrwwmanW/cMHmmEDZGZlM=;
 b=HO3Nx0LCsoJiO1CpXtvYSQh67gIOJK+0fB1scqoZdn4gJTTLSwOyVU5a
 m332H1yhurJBa68unc/99VztzCkp0LS9tWEz6X40Z1Sa3QA59KBgbd0NS
 C5lh04KqVQMAJM9okxYSPN0k2zEde87hEt18h57Hd7daGKzxTnN/R0Frh M=;
Received: from mail-mw2nam08lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5HLB3/vimMn5YZuSUbXQSBeLs/bv+KJ4ZbNo5KiXPIbMcoDcpCK1yxeo0zF4EJ1Rv3Gy/WgsriJzfqYLhv9YSNWNacbb5ne2dSc8lY3SIGdXtwovXnY0RFXt0WIrMhfWMAsxG81iV/7+IaJ2emHsT/u0ta6G8rqj2ujgSPwDfH0WhHFWvl2QNJWn2hs6G08wZB55t/isd5Sen/dDkVEaRyPkk0WsCESoKeDYeu1SFuqi6rO3L/X8tVBSHrhP0fRmgfDg5aKEnA2VqtTNbq2Fv2W3412DZ6+PV1L6UqptE5EOaGh6e1NltsYCN2I4ZyYENS6Orh7QMVhdWYxbmFmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbr57kMzeruIdKOocUwi1OGrwwmanW/cMHmmEDZGZlM=;
 b=TXpJz6B9ipImuNv64QOJdJ6xxSaAu9tnIFG6uxEYGnzowMmg+EIsavuh9YxCQkdqhYqMvdM44zovUHgnftquSwYWK/flMDQLIb7xJehNmLBh7lpEk+m1UIFgYHGTmE/0pxGW1P3rUsM0E++v6snJjKCPEzdTATYKR97R5LIUuUXYZLSOYQ/R3AonNME+ugsTd/H6dPMo3u65+BUGSOJtZmVAItpy8KqvYGOIekiqhPw0jnENFOLui+kzm9PT69TQND8lhkXt2xvnZ9xMIVF/KNUg0JhBG9XyhhsnudZgxrS0PidSnRnfFbvoe9kgUSD+4/yRN6fjIQq1qxgD6kzoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CY4PR02MB3270.namprd02.prod.outlook.com (2603:10b6:910:78::26)
 by CH0PR02MB8027.namprd02.prod.outlook.com (2603:10b6:610:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 09:55:57 +0000
Received: from CY4PR02MB3270.namprd02.prod.outlook.com
 ([fe80::98b3:9497:c653:b2d8]) by CY4PR02MB3270.namprd02.prod.outlook.com
 ([fe80::98b3:9497:c653:b2d8%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:55:57 +0000
From: "Hari Chandrakanthan (QUIC)" <quic_haric@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, "Hari Chandrakanthan (QUIC)"
 <quic_haric@quicinc.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] ath11k: disable spectral scan during spectral deinit
Thread-Topic: [PATCH] ath11k: disable spectral scan during spectral deinit
Thread-Index: AQHYSwsB+k5I2LqzdkW0ruHTdZY+V6zlkNvvgBN6/tiACQW0kA==
Date: Tue, 26 Apr 2022 09:55:57 +0000
Message-ID: <CY4PR02MB32702916194AF1DD0AAD009183FB9@CY4PR02MB3270.namprd02.prod.outlook.com>
References: <1649396345-349-1-git-send-email-quic_haric@quicinc.com>
 <87fsmooz83.fsf@kernel.org> <87levzohyk.fsf@kernel.org>
In-Reply-To: <87levzohyk.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfdd68d7-ef1a-4148-d07d-08da276af61e
x-ms-traffictypediagnostic: CH0PR02MB8027:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR02MB8027DD06C068D4489BFEE3D3FFFB9@CH0PR02MB8027.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JrU8hl5bULyNPxjN3vZ6sG1piy9O00vZ1mPlg5vEETfl3j+VXltstxtTxrGWtHWapG8jRFPU1mHJTAFV2QGDFxVrkxWFd4xIqAo3s9ew6c7S6oDJmq2BlGNLBr3uAHB6A6nJJERBM3O8YyIW/0rN0PggTKay4V/VguXVyzrxDNcTB0YUdGmuV/xKuvyUaWrN/55xG0RIk2lxlSBJMTlrH/SecR+COZ/kppYjwovvY0MEtQlZIWeexCZ7nEvZJXnk9twE8RoE9sZy+xAOK0FUm+lBYQK+cmaZviw5+o5aw8kejSIu0qWDvHOt2CYkkckjA8m4MdLkP/9tsD8PXVWzWRfRE6zEgjuZKdfQoQKPRAZ9CNYmAHHunyaOl/rUs5sU0uF47RBk2k3Yet8C8n1qfV8ST3iwthJVxCbmVV4BXZmZZnHUb6jQDq1eo8eIqfpMy+h9aDfuNI+MCxNPvde2Bkg4aYrLoVoBRCCKF8iX/oX0svc3Rk4As8SY+d5ZbbZZDfk9+/nkhx2mVQDGwsaKqlZZm3izNWKBHYhtCTpHYMQFETmrEHQ7SOd8AkC94aVw1KP+4pU8fiwVHjUV2lHOyPQdj+xUAz2mqm1Tf1vWd3RLe++ckn3r2cJyg63q9HAABNfnDIqvPFrS69NLbI/KlXbHi4K0xl2kNEFHRdc6yaZOMWHLZkHQbK8edbl/YUoLOlBL8Oro3fhEcnARfwA14I3m5zVJZfmHxiPNF/AfsLnD5bK9wnlSg52nh4m6peofe5Bf3P1HtyNynN6rp4Iuep2j20odaEpUdHZNJcr17Fxt/XBAr8jf/Ka35Kso4NQVVn++D3NDSwCycQYiUpZUKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR02MB3270.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66446008)(508600001)(52536014)(8936002)(2906002)(6506007)(38100700002)(38070700005)(55016003)(26005)(9686003)(53546011)(186003)(33656002)(7696005)(966005)(5660300002)(76116006)(66946007)(66556008)(8676002)(4326008)(86362001)(122000001)(64756008)(83380400001)(316002)(71200400001)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2hILtSSal9jLS6/D11igMi6aSJ6gCLDlLqJBlSi6w5Ghs09yTc2Gmx/h+cMU?=
 =?us-ascii?Q?lkMgJ0cqQ5rQOlMIMTFhjkRtMa7hj7p1C7N1moqUJdt9Prx2THLMFCBeQbWp?=
 =?us-ascii?Q?44F0Vt7OsURJpsBdqfOJRMPszEMDBEELWb3alRUaP6tjqwVOxhG35+EDnp4D?=
 =?us-ascii?Q?YU7LqDdhWeR6JYXElXzlp3X/lVmLy0xIrOKugvUfq1yKesorApEy/iGurOtc?=
 =?us-ascii?Q?GWpfS/3g4j7zweb9Mc8YQ5Dv0truKRIzrcQ7qKmD9iKlUKjgCRt8VkjdP6+X?=
 =?us-ascii?Q?OK16sJCUIl0cKMBZ50S3VMNQFI31CVtin8zotWoByfOPQNmn096+ZsNHQCdK?=
 =?us-ascii?Q?+9CpOnyfxWHbwL0tkoKjKUG1YmZYTkUN6Rxi/9/CxMDyz6cT6+S1pnbF+p6g?=
 =?us-ascii?Q?cBCo65mhj8Ql46WyK0iZp0xuF994LLixZrodOrAW9WlP0YBI4884gaZ4Ws9z?=
 =?us-ascii?Q?tuX+z+MHVc77YCxD2mnR5Kht9Fy0STZNbU8jFkyBeeA0o+Wh55rq+XYVrVj6?=
 =?us-ascii?Q?d8De6OUViPUPfkGHFyMMiJD400QRuLX37UtQ9XA2yxSIjf+nMDCNvFIGjHjG?=
 =?us-ascii?Q?euUPb6YsV7rqV4EqwKzUhZw5fc2T2N6sCe6JvLmuqEdtt3sntKCymi6P9o0e?=
 =?us-ascii?Q?Rfs+DnxpijZSfOJqqStu3emAp2UqXMPahSe2THTjzUsrQunfd76tVUJ5TNIq?=
 =?us-ascii?Q?w85D18tkL5HRjGIJKF8LcZES57N77f1to+FrZ23oQnmHLRN3YZoQkHqS59rk?=
 =?us-ascii?Q?vm7cQBS6/rRXgh829fT++FSCQEGmxtUjwLzJkJusX4EL5l4tahjXuBlUglSt?=
 =?us-ascii?Q?dGNpOQKKkkAcQ5Fu3valI3BM94j0JBig6D0uMnfR/wpLRvojmhYLOA812iH3?=
 =?us-ascii?Q?GG4OaOT5EUatGXQ+h0bBGY2WBtfFYKzfA+HugJksg84XdundUNHM9MEuv/1E?=
 =?us-ascii?Q?rjmxO2HiQ5TBCSMoeeRzO+2UDLJ0+3ZjpYafFHO19G9o+dWiQRd9VlLeifLH?=
 =?us-ascii?Q?VyAWKClaFotMhYAZXWZRzVbSiXlu2TaZw/SO1hqM9+RGsRySdIEVSMr/X1jB?=
 =?us-ascii?Q?qsRW95MrXh6tBgm5LMXKgDJRhZj6liHfkxSyX72eZZdxaSiyh7fK8wricWqT?=
 =?us-ascii?Q?hIDFBjizgeN6YSdQ3hOxaIIJitlfBjyFNiENj9hC2yX+3uzLif3ZfDDRtghv?=
 =?us-ascii?Q?H9Fm/4njv1g7UtHgFjLUR/65BP3YWdcsnW//mAyIV60zwgMu47Pijrw5fZNi?=
 =?us-ascii?Q?5IXyl1Iag7WtaZyV1qK5d2nq2iOwHLwNFr6YVy9OAUOZTOhx0m1O4QqHDR5l?=
 =?us-ascii?Q?B4valbq0cuyd03MDJYdgqA+nbIJtFdIH1JhShXqqhmvBBrbBdlPDCF8aSkBx?=
 =?us-ascii?Q?ldqAabNuzjddjbesOCfCnO/QGo5rt3Wu2ro4RuIezoQTyvoYLLR04Udp/myL?=
 =?us-ascii?Q?9BSoYCgt4zT/mlmZOgOlZ3g/OISOs+d3qjvr2QFTDPRmlGqaxc8mLqpFxpKW?=
 =?us-ascii?Q?nJST3pMsLmWZZBOcTMSOiukaOxeHNNJwbiEaj99XVh/j29svWe2khRFGPkq9?=
 =?us-ascii?Q?TvBioBu8FSvaZ9gAR5ZBCeIEe4qu/iNYr/OyvBFWFxXjh6OYR4DLaDBNip4d?=
 =?us-ascii?Q?lxnmISHyPreJrsL3/vYceGd2pNFO4UTdBUxHeGSLfw8RwQI+VLSXstn124O4?=
 =?us-ascii?Q?TF86dR0KqVbGS55ypte5i4h+t4s9GAumFW61oL/YDRzAMkZ1aTBJ8lQPq5Wa?=
 =?us-ascii?Q?GbGMJkKuIA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR02MB3270.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdd68d7-ef1a-4148-d07d-08da276af61e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 09:55:57.4952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RRyiiASc7XX/fx62dyA3BGZyWQ4Zh9JJ3V+ab7XhutReA4p8pHNwZVFy0b+KbBioqu40gmeDG9djMApWqLwEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_025604_260583_1C6BE739 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Kalle,

Tested-on: QCN6122 hw1.0 AHB WLAN.HK.2.6.0.1-00851-QCAHKSWPL_SILICONZ-1

Thanks,
Hari

-----Original Message-----
From: Kalle Valo <kvalo@kernel.org> 
Sent: Wednesday, April 20, 2022 9:39 PM
To: Hari Chandrakanthan (QUIC) <quic_haric@quicinc.com>
Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: disable spectral scan during spectral deinit

Kalle Valo <kvalo@kernel.org> writes:

> <quic_haric@quicinc.com> writes:
>
>> From: Hari Chandrakanthan <quic_haric@quicinc.com>
>>
>> When ath11k modules are removed using rmmod with spectral scan 
>> enabled, crash is observed. Different crash trace is observed for each crash.
>>
>> Send spectral scan disable WMI command to firmware before cleaning 
>> the spectral dbring in the spectral_deinit API to avoid this crash.
>>
>> call trace from one of the crash observed:
>> [ 1252.880802] Unable to handle kernel NULL pointer dereference at 
>> virtual address 00000008 [ 1252.882722] pgd = 0f42e886 [ 1252.890955] 
>> [00000008] *pgd=00000000 [ 1252.893478] Internal error: Oops: 5 [#1] 
>> PREEMPT SMP ARM [ 1253.093035] CPU: 0 PID: 0 Comm: swapper/0 Not 
>> tainted 5.4.89 #0 [ 1253.115261] Hardware name: Generic DT based 
>> system [ 1253.121149] PC is at 
>> ath11k_spectral_process_data+0x434/0x574 [ath11k] [ 1253.125940] LR 
>> is at 0x88e31017
>> [ 1253.132448] pc : [<7f9387b8>]    lr : [<88e31017>]    psr: a0000193
>> [ 1253.135488] sp : 80d01bc8  ip : 00000001  fp : 970e0000 [ 
>> 1253.141737] r10: 88e31000  r9 : 970ec000  r8 : 00000080 [ 
>> 1253.146946] r7 : 94734040  r6 : a0000113  r5 : 00000057  r4 : 
>> 00000000 [ 1253.152159] r3 : e18cb694  r2 : 00000217  r1 : 1df1f000  
>> r0 : 00000001 [ 1253.158755] Flags: NzCv  IRQs off  FIQs on  Mode 
>> SVC_32  ISA ARM  Segment user [ 1253.165266] Control: 10c0383d  
>> Table: 5e71006a  DAC: 00000055 [ 1253.172472] Process swapper/0 (pid: 
>> 0, stack limit = 0x60870141) [ 1253.458055] [<7f9387b8>] 
>> (ath11k_spectral_process_data [ath11k]) from [<7f917fdc>] 
>> (ath11k_dbring_buffer_release_event+0x214/0x2e4
>> [ath11k])
>> [ 1253.466139] [<7f917fdc>] (ath11k_dbring_buffer_release_event
>> [ath11k]) from [<7f8ea3c4>] (ath11k_wmi_tlv_op_rx+0x1840/0x29cc
>> [ath11k])
>> [ 1253.478807] [<7f8ea3c4>] (ath11k_wmi_tlv_op_rx [ath11k]) from 
>> [<7f8fe868>] (ath11k_htc_rx_completion_handler+0x180/0x4e0 [ath11k]) 
>> [ 1253.490699] [<7f8fe868>] (ath11k_htc_rx_completion_handler
>> [ath11k]) from [<7f91308c>]
>> (ath11k_ce_per_engine_service+0x2c4/0x3b4 [ath11k]) [ 1253.502386] 
>> [<7f91308c>] (ath11k_ce_per_engine_service [ath11k]) from 
>> [<7f9a4198>] (ath11k_pci_ce_tasklet+0x28/0x80 [ath11k_pci]) [ 
>> 1253.514811] [<7f9a4198>] (ath11k_pci_ce_tasklet [ath11k_pci]) from 
>> [<8032227c>] (tasklet_action_common.constprop.2+0x64/0xe8)
>> [ 1253.526476] [<8032227c>] (tasklet_action_common.constprop.2) from 
>> [<803021e8>] (__do_softirq+0x130/0x2d0) [ 1253.537756] [<803021e8>] 
>> (__do_softirq) from [<80322610>] (irq_exit+0xcc/0xe8) [ 1253.547304] 
>> [<80322610>] (irq_exit) from [<8036a4a4>]
>> (__handle_domain_irq+0x60/0xb4)
>> [ 1253.554428] [<8036a4a4>] (__handle_domain_irq) from [<805eb348>]
>> (gic_handle_irq+0x4c/0x90)
>> [ 1253.562321] [<805eb348>] (gic_handle_irq) from [<80301a78>] 
>> (__irq_svc+0x58/0x8c)
>>
>> Tested on : WLAN.HK.2.6.0.1-00851-QCAHKSWPL_SILICONZ-1
>
> Tested-on tag is not in correct format, but I can fix that.

Actuall I cannot as I don't know on what hardware you tested this. So what hardware did you use?

--
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
