Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2DBC433FE
	for <ath11k@archiver.kernel.org>; Mon,  7 Nov 2022 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmO3HXb5Imp+9e96f0TtBc5bqFEENpHgYun4LDLvmjw=; b=1qgCZVbTJ1uGE4
	NXA0G9U5VFYaIPVWGm4kKleKmNZeBhZB5b0ZRJy2Eht2qdQDxNh1i4c3ZRnuCuooS38v7jsozF88p
	YiM5K3S2heex6UFLST38RbaCLT8zUnzvkXUQ7Nu0mtxgjkmwRWdoDAxiUo+YHI7iyFcf0iw4f4i1O
	7/UqGucxH/9lcdQxiJXej76jd+tUVCNEjpWqkyTruZRN1wcghp1IFq6FJHT2ERFqbde0vVzdqMrJs
	/NqOhq3o0iwsSAMzbXDKWFQAq604R6pfZ9uqv1JJDjTUa4ZBOc6ESVJVVaWjLhVWXiBJrceJTZpAV
	1HXGS3cTQOPRfu8Fd9qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4g3-00G1wV-RP; Mon, 07 Nov 2022 16:08:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4ea-00G0vj-5n
	for ath11k@lists.infradead.org; Mon, 07 Nov 2022 16:07:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A7DIqNc015284;
	Mon, 7 Nov 2022 16:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=t40kG9BHmf66XU7YRPgK5BTgtbugIZM7bDWoY+8pyVk=;
 b=LEwq7G5p2iutwVsdkLclBfUCcgjp4CTjvPfiWBuvtOtbiHE5sEoCwFSn3CAkiTKwHQFO
 iXxy1Ns6A2l4aLdKm/9pvg6wmtvLqvm9Wt2F7I6fbWC4BLvWGv3yl4+P1wbhykJ0xUTq
 FWiESOS+MOFcNptUXQ7wkxaS7BJO77hU3d0EusxCF5a2likSO3CuT+esFYjsat9XZMW6
 zJd9jTESNMUhkBiRHV9sba+LTVdvUfd1LXPt2YlyK7f7031AMFRTH6h8dbXj+VLkbVre
 7DlGE0amT0ui/W584CXH79uyTmZQsW+V88zGNvszpWiefzGcQfDtedNMDsMeLz6dphwW 8w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kpv531d9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 16:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXrspYQJsMJv+/vERVdpXFeh2tRoDA9cnwknyobiLE9BX5FjoWAW94oklZpirafi7TzGSazzf6oRr632vhzzVNHgt6Q+CqrsD9+CR1IAOH1jqKslEizno0BCr6YV+fG0tK/lqruvZAdb4b9q/k8Cj1bz7IUM4biiMS1KjaxhqMkFMOw1NplaiMiEsX8gC8dvnmV2EjLvSufqDqRoh2yBDZXnDP4sjfJZUCb6joIUjkcILPjGTBnUvxPQttTfs7PtuzC41bbhyTGp8R2iGnG7jGcmsMedpc+fWYJGTGRUPwFbl6ocj6OzKvOAWYh//mkSPg0W7MsxWGEFRGX90KNiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t40kG9BHmf66XU7YRPgK5BTgtbugIZM7bDWoY+8pyVk=;
 b=MF5G0yc372Gc6Qx1zS5Gd+B9WPruSVfoF2OflKqoHxG7lNTuCr6TqQFgsOaHfqNvpn596cI3fnnhaSBZ3sSY3FwPYSouOATFJMUJixf9+rcQXHk1Q7C2SdsM0hH6Ic/sSs5xz64WzU8AwTC9xnttbsEOH1TlkmttPQPHAuVQJNTWmLZvwj+7b0LHuLrDGKX766CvIq07cP4VIR9KMCYP9D6lX/3CgoMeVsSgbzVpSE5c0thqXIRaF+40o631smDCBMmjxYjSLjXzkNBTwoj3YXLzCkmO/mMhqs14+x/BoZAPWLctD9Xyq8NOSobZ9JSWjdLmag3DdzUCn4DT/jxkGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW2PR02MB3899.namprd02.prod.outlook.com (2603:10b6:907:3::30)
 by SJ0PR02MB7661.namprd02.prod.outlook.com (2603:10b6:a03:328::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Mon, 7 Nov
 2022 16:07:07 +0000
Received: from MW2PR02MB3899.namprd02.prod.outlook.com
 ([fe80::4957:92fd:2b06:8927]) by MW2PR02MB3899.namprd02.prod.outlook.com
 ([fe80::4957:92fd:2b06:8927%5]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 16:07:07 +0000
From: "Nagarajan Maran (QUIC)" <quic_nmaran@quicinc.com>
To: "enebeo@gmail.com" <enebeo@gmail.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: RE: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
Thread-Topic: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
Thread-Index: AdjypdZHxUqV8yenTJihdx7pusARDA==
Date: Mon, 7 Nov 2022 16:07:07 +0000
Message-ID:  <MW2PR02MB3899226DC8F4EED0BF9A66ABED3C9@MW2PR02MB3899.namprd02.prod.outlook.com>
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org>
In-Reply-To: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW2PR02MB3899:EE_|SJ0PR02MB7661:EE_
x-ms-office365-filtering-correlation-id: c0aa1d89-0d5b-494c-3322-08dac0da1ebe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bAECWOOk8iktXJ0p20tnvZy4k7dkHYzjG0gAVYOYICeGgjVFxE5Lql8RKc83mBM/qX1MPYVBBDFj7DAqNOEuLQvei8d+12t41OjNg1NTm8qe/lzDreFD+gH8z6mjex+9ZjrZAHjsONUYbxLLHsre7gps+tru7hd1NeTZwlWU7Vrn2+EQlMHyjTwj/0itFH+fENi23w5pplj6zqdxOXmt+98iin7bXrXTT+FgO1a+uUbzLco42sJ8xvuXAdIFPxMNSv6ImyrpOHZ1vQCZld3ZGoVZsUjMufySC87ucx5gsvHxihVxA06AQRJlKqjhUwZ6hYlSsyVEWVPgpdtps1a1hphuWyjpq3sY9Qq2mFgab59lq51xAAYY1EyKEpiRFTVLLhJzdLdasUoMxIYOVOahI1A8m3r/l1Tl9YC79YbTPpqmub95N5yqgkxbj0Sh9ljznhRU19knmW/T4IjUJs5HaC0pvLY0pbVS9h3/nqi3HG5ZP581CwyXpWKldljbTSC0k8gccuQtizDYbB+0ICFOrPWgnuMa4FN4tH+uGWqbnIITozRO4kyiMXDbxwUurN0TzrcapDFzFiDhXdvilB8xyXhxkN2PLbCory7buYjQvP2u/burJpKxAokjlCUr541fZSHiVPjEUtRmaFpEkc1yv9kRfVYpzue2chi1hYQa2vKWdtYOcVXxDaF7jwWTXC/O+nouQiPKeE8/nm7CxY6Q+8c+Gu1RJ+peazqoS1W/xAAY06Fk2RYOe2/HwEq4w1gx5eLR+0CeFbiZq11tsq1nZw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR02MB3899.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199015)(186003)(4326008)(8936002)(52536014)(41300700001)(6916009)(55016003)(316002)(7696005)(6506007)(5660300002)(8676002)(53546011)(64756008)(26005)(66446008)(66946007)(66556008)(76116006)(83380400001)(33656002)(66476007)(9686003)(2906002)(4001150100001)(66899015)(478600001)(38070700005)(86362001)(71200400001)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?kphSG5l9enkoxFGozP62UHAM4ilWjsjcQPyHG3cxuJLiI7U1dr1myhxEG0Ld?=
 =?us-ascii?Q?j65Ca9mud4PJqvi2hAzosxkiStCFYcTRMrTj8wlp64UWcweJb+qkub39BvGg?=
 =?us-ascii?Q?RcPRcXWC5vuOAehX+RwGSA8Biexn0ktN8yrL8BvVd4pt7uoZyhvu8apJQNOd?=
 =?us-ascii?Q?narIIAIOpYxjxWFWkkRWPxyrSVQU3hn9tMG0//bv+lB21c1lg3fVIJWDdmyC?=
 =?us-ascii?Q?3+POxidji1jckk+jVQg6vH2mdzkTajqiBG+/nd8IkGe0AP4883XjV4Yrs+k1?=
 =?us-ascii?Q?+WeizRcotlGQ5hVVlnSE1KWlqHwQtJ2DAfdOmeax4aDT2xCdPzQAiDYE6TwL?=
 =?us-ascii?Q?iABu+jyGWaZQzbsf7uiYqtVEm88R/wo8P/gCdM9Z41jeQudQO6q2YHLCIPGl?=
 =?us-ascii?Q?e62BQ7bgY0xDSh65uAC5rP3dN8pJMElkgdY+hQVpykwRCmvAcso/zqbk6sJy?=
 =?us-ascii?Q?PnT3491FWGUuhjJiodOs5RKL0Tp4gXB/BXP3xIVtBAwtQzMzK8A+BUwNUgq2?=
 =?us-ascii?Q?muZ38qL2ZZjTD8jmV7WnBBGY5VmYAdW4yi3Ay2A1aaQ7tcOBMYr6yD9aolgq?=
 =?us-ascii?Q?RI4BN51AagjNcQtQsO0waESu3vquy9eKVvAEJKfOWyXdBPZUPgZ511DH7P+q?=
 =?us-ascii?Q?/dy/j7SmSa5FtSkFzbtazNFPULa+4gMRr3mOiJE4mNDahbeIeemg3k1DAnSw?=
 =?us-ascii?Q?O7miPYbDmtsVnW8XuGlSBhl6d5zmA19jgZuOJx1KVVNGDBhaZOSuZ50s2QJN?=
 =?us-ascii?Q?RUHdONjS9PIuGJRvKppsywkTED1QgkMYHyveHz+iGV2SPDnF+jxdZ3BBc56N?=
 =?us-ascii?Q?8WxQDp2JXsKoLF848Maw+4tpXjSEa0CSpC40xEBKi3W1OTPEJo2/cYwAqLba?=
 =?us-ascii?Q?K4Yj5hRwE6bho4l7WqdgAJ/x4kVn2mhZ+G6IW5eT7MxYQAH/NarYh/c1lB0U?=
 =?us-ascii?Q?LysJ80mz+zEzSx+EOt8VH4pe7LpmPOX0x5jdWbgD/bwUq9c8N4cntBSLlJ5K?=
 =?us-ascii?Q?OjPkf17SkLIyidaYaSzOdK4dkMstEF4APj2EyCklxP1PbvfkvbyJIeuyxQ2R?=
 =?us-ascii?Q?ofWEUN+RYnoHfCPXAfbGbgjEGWPptee8ad0WGLUm1Mlqh4HGDNdVJmVCLthp?=
 =?us-ascii?Q?0qwoiEPw7q8tPAfl20OriMPs8Y5lAA5y55CSZe1fNWHE07t/c5GCSl9NfveE?=
 =?us-ascii?Q?91aN7QAbBtSqxyFS44Rkdr5vIqzh2ftQfKit/T8B8HIujt6Opz2Eb14xyUIT?=
 =?us-ascii?Q?kl3aSGZoTEybq1/DLVHU1+ZfXwvt0Vqh+R/qJTP0uqP8H65MuwiSoFSiMv/p?=
 =?us-ascii?Q?pHsZr6NqfEQhssG6FMY/HG2rNgZRpfhBzT1TlN+FRhHvITX5+59nk7NGGrDQ?=
 =?us-ascii?Q?R7JrfawIJ1sNcVEQn4Zmxy8NPooX3jVO5rWtNzoXrjKMClgomN/H6968kzv/?=
 =?us-ascii?Q?N8gIKvG2C/8XoylQllWFM5SVruFx46ua7bnCtEWgpyWyQ85GY6YsyN89y8Hk?=
 =?us-ascii?Q?3wbRp58e7LORzRXP0CWevxPtz4QMCA+BLZOm7EwEM5uhRtpueno1txaOcVSt?=
 =?us-ascii?Q?jibx6SmsbGyZdPMvHVXVq72x2m+NCDVjC9cbL0dg?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3899.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0aa1d89-0d5b-494c-3322-08dac0da1ebe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 16:07:07.7218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0vunvz9/lh+A4Bl7hMV7acg7YNCkvU75jvaIlgMXO2RCAjAgDXfdXf8y2GHKzNly4hSJ4Du9UIVzHFIQ7yAOdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7661
X-Proofpoint-GUID: MAJzuP-493ruznSvOdAqYYs74Z355YgX
X-Proofpoint-ORIG-GUID: MAJzuP-493ruznSvOdAqYYs74Z355YgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1011
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080716_286322_652373E2 
X-CRM114-Status: GOOD (  22.07  )
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

Hi Mariusz,

We are looking into this issue. It seems that this error can occur when the given frequency is not present or when the given frequency is disabled.
To further analyze the issue, could you kindly let us know the output of the below commands during failure case.
     1) iw dev
     2) iw phyX channels

Also, could you kindly send the WiFi driver boot up logs with "debug_mask=0x212" enabled during insmod of ath11k.ko module.

Thanks,
Nagarajan M.

-----Original Message-----

From: Mariusz <enebeo@gmail.com>
To: ath11k@lists.infradead.org
Subject: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
Message-ID:
	<CAJrE-q6NVEF4sNW1s4Zz7Pb2ryzCi69e+_vLQswBWm747DHYDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

As support for QCN9074 got better I went ahead and built a 6E linux based AP. Dell R720 server x86 running Linux s4 5.19.0-23-generic #24-Ubuntu SMP PREEMPT_DYNAMIC Fri Oct 14 15:39:57 UTC 2022 x86_64
x86_64 x86_64 GNU/Linux.

My issue is that I cannot get it working on 6GHz bands but it works fine on 5GHz. I bought 6E version  and since this is a single band module it cannot be both 5G & 6G and linux driver does not agree with it being 6E version:

[71914.038562] ath11k_pci 0000:03:00.0: BAR 0: assigned [mem 0xdf800000-0xdf9fffff 64bit] [71914.038840] ath11k_pci 0000:03:00.0: MSI vectors: 16 [71914.038852] ath11k_pci 0000:03:00.0: qcn9074 hw1.0 [71914.194459] mhi mhi0: Requested to power ON [71914.194712] mhi mhi0: Power on setup success [71914.297749] mhi mhi0: Wait for device to enter SBL or Mission mode [71914.647118] ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff [71914.647134] ath11k_pci 0000:03:00.0: fw_version 0x250a04b8 fw_build_timestamp 2021-12-20 06:41 fw_build_id [71916.310787] ath11k_pci 0000:03:00.0 wlp3s0: renamed from wlan0

HE PHY Capabilities: (0x1c604c88ffdb839c110c00):
                                HE40/HE80/5GHz
                                HE160/5GHz
                                HE160/HE80+80/5GHz

iw dev wlp3s0 set freq 6195 160MHz
kernel reports: Channel is disabled
command failed: Invalid argument (-22)

I am using the latest firmware files from ath11k tree. Is there any special firmware to force this to 6GHz? I read somewhere board_id determines which one it is and 255 disables 6GHz but I miss more data on that.

phy#2 (self-managed)
country US: DFS-FCC
        (2402 - 2472 @ 40), (6, 30), (N/A)
        (5170 - 5250 @ 80), (N/A, 30), (N/A), AUTO-BW
        (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
        (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
        (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
        (5945 - 7125 @ 160), (N/A, 30), (N/A), NO-OUTDOOR, AUTO-BW

It works fine in 5GHz but this is not what I purchased it for, so I am puzzled if this is something in software or I was sold wrong hardware.Is there a specific board-2.bin for 6GHz? Since the 9074 chip is the same in all versions perhaps this is a software hiccup.

Any clues are welcome.

Regards,
Mario


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
