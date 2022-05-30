Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FEEC4332F
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TM4Z8znjsnPxckojhZtzTHzhoG08IHss9a2ISFnhUzI=; b=QSRKwIYODSow6P
	fOmNWQDh9y+8goc9lmgBoSNr0wcZ13CLQYq/I0ayQkzRPRfNAJ+MLybx/xYzptDNs+lunHqVE4dX3
	01HpKGNDXeECbO84KFO3NLK6Buv8tbf/Yeo0GubIXmwFqzxdU90cEbRM08nIUbikb6X2U6oKIfjVX
	GpXuQxaiSkqZ5R7Hk8BurMzylKsITXhI8sBtO2jzyWz+swjB5esqtElWUi86t7ssU5VW/w/JqZRkS
	oFDZXv2PNj/gBa86/sXhqHr3m9gCPOVQfSPJpxd1aYKbIpoPMSPkwYVH6ovuPQhPMkZIQo/EpYhhd
	9Iz1KfY9PdftGE4av8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvf8f-006byQ-Bc; Mon, 30 May 2022 13:08:53 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvf8a-006bvE-BW; Mon, 30 May 2022 13:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=qca.qualcomm.com; i=@qca.qualcomm.com; q=dns/txt;
  s=qccesdkim1; t=1653916128; x=1654520928;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=61Kz+7XYiH6k8tXLpInFD4i18zv3bWc6W/lqTT8AinQ=;
  b=oV02Ujga2UyktxB0IHKs+aoKarojE4arcns4h2dZdvntV7a5gbHqUXHN
   hEsLmhSjx/tjTFgwB43UQXN2UqIZu09Vn2xQtUcsqpe3DJRvYPuAHSV4O
   u2NMD7P6XCMdcO1D/dG9qrIRI6d1ihwYaDcD6RvatZTh2pdeS71+riVic
   Y=;
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 13:08:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yn4pEb4jdo3h8q7pAKTrHtkdGTsY8gRFG42vuqhmKbQ0CkZlhZJDKRdXRjwZHMyQop5qZRGpJWfEpQUGz1pT6dr89gtq0/X0S/u3jDLXsd6rC0uy1g6Pj/K/Ch/0h8tGeZ1UjWXsJKBn/9CB3n8qayYtw8Wzmsf5nVkjgvtPReCTqA2Cyd1TA5msoy6M8FQzhWEhAdKXpMMzWhd3HoVx2/8WDlljdqLPz1SznuzzE2mcZPWNVZQuFvPt8Xqp/k8AxZithoCO/4ZEz5HDSC4qy99jVedMJHMRWi09qJBeZ0RGrgXuR1lR7MDKz+xPoc8Y96b3zh0uX5N2C+xQ3vYT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61Kz+7XYiH6k8tXLpInFD4i18zv3bWc6W/lqTT8AinQ=;
 b=JWLgSmcxgTaYPFn1Ab2z6Mmtduj82/8BjXBh/b+YmkCTWRfnP0rFpoYHZsrjB5I56wLHv4XZmr/7wfj3x5uWptM58dm1evjqW3LKp6FnU7ANND12irRoZiJ4xHeT3oxdrJ9ypexkTM0F4d0fj7tblqoHbwGLZQ0FPdSdyk8pfBCQ/4Vr9X50t7ZatZQ8iUcSyFRZvopdkkZc0cUx8ni2jN6CWYML24JGAR/Y3DGLN69YejeOzIoOy6DtTmrquIVTu7KvDawtgf1O9QyeUmCy5NH187jRIkl8sQct6WwCDAQ/ud39ToAE6O8GtHUkW+cATuCl3sTOuO3iyJfGYDUQaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qca.qualcomm.com; dmarc=pass action=none
 header.from=qca.qualcomm.com; dkim=pass header.d=qca.qualcomm.com; arc=none
Received: from BYAPR02MB4567.namprd02.prod.outlook.com (2603:10b6:a03:5f::14)
 by BYAPR02MB5493.namprd02.prod.outlook.com (2603:10b6:a03:9a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 13:08:40 +0000
Received: from BYAPR02MB4567.namprd02.prod.outlook.com
 ([fe80::6d69:ee43:fa43:5f24]) by BYAPR02MB4567.namprd02.prod.outlook.com
 ([fe80::6d69:ee43:fa43:5f24%2]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 13:08:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: [PULL linux-firmware] ath10k & ath11k firmware 20220530
Thread-Topic: [PULL linux-firmware] ath10k & ath11k firmware 20220530
Thread-Index: AQHYdCXVbEEoqRIoa0OQdS5Y1EolrQ==
Date: Mon, 30 May 2022 13:08:39 +0000
Message-ID:  <BYAPR02MB4567904C36E83634CB0ED09292DD9@BYAPR02MB4567.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 71664d7c-22b8-0d29-63d2-295fa1ea744c
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qca.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7464782a-5c30-479d-8c2f-08da423d83e1
x-ms-traffictypediagnostic: BYAPR02MB5493:EE_
x-microsoft-antispam-prvs:  <BYAPR02MB5493CE55054D283EDF90059B92DD9@BYAPR02MB5493.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qm4ugN8OJh8Rb/f1g5NzXriCni+87fhCHylWUKUKEakIlZcuo7FkxYxky7A9oge/3KleGBC2Q6TUIJhG7u8kC13ouCbAvcMM4xOjcLcqMwfQMsobtWlJ/em9UUTh9/clhL/SWl+qJXa1chzXCYN0S7LkMrF2NyLT1i+MbUsepFtDzKJK5Bk04+uN9+qBq/YRKNseh67Eeab7q0l2PuC0PQvPHbyAhEOBcqCgL/z5WYheTCEaQo1sm4dkPZ56bqFxnz8Icf0l9weYfQE52DAKYfycdfcB3IPByDfxQbrpLvVEbwCjqNKYo5JG3qRmTYsuSt/FLozhZNmuwV85cZz81n7WgJbgWECkqqG0oXLZrbPEikH9pdaOaKo0eLU8fYmiy1vy9/4OR6iw6kh7XIpiHNQo9wJ5Xf/FXsvLpiRnijHVDZG3uPUQ+FRg32iGOZ8voftLCY3pJmplMsOhHw8k5USpFi4Jih+xON0QvKbEal7UKDLx+xyVNKOg+26MCyPSXTXnsTS9ItBok7DmoJrfODHYA9afXZDQlB/nByzn9sPAaq7UxqtN1V4pLOvvN2D+HdF68xkrqb5xW6MrAnrBM/zmi2ROE2y25jFv6cMq+WQXjWLmw4Zs3/lnLxVa8+nQpEl6iFxnb5awfst4XKxn9gy5aVypSDtJQ7gh3zyve8wUiDUGOzZJVVycJ5Y8t2T4705xPdpVslbTxT5BM4Rt9g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4567.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(83380400001)(66446008)(66476007)(4326008)(6506007)(76116006)(122000001)(52536014)(54906003)(2906002)(55016003)(66946007)(8936002)(186003)(38100700002)(9686003)(8676002)(71200400001)(7696005)(38070700005)(26005)(86362001)(508600001)(6916009)(316002)(5660300002)(91956017)(66556008)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?yl4h92FceXGVxE2ECwCnQOSQ3+Z/kQCoKo5PM0lNUVgtauExFaKjbBwSCI?=
 =?iso-8859-1?Q?PwB6ebqQ10BTtDijKIieVSies2/BrD5U2UgV+saSqk32h+umQ3vTvoksvY?=
 =?iso-8859-1?Q?ZRDCgOA1cgzLuInd47OvkDAveW8b0Qnf/lWo/o2hEXwO4mjNWBbHAzwMIE?=
 =?iso-8859-1?Q?/wnJ5AsuZfvCwaBFAHmqEk4Rz5hmDvbQsXxpIrJg2UP/z++yKuFM5DWBh4?=
 =?iso-8859-1?Q?BKEG26KaZ/R4Hoao+7pYn3tu76yW66ZdnSlIFfiQffsmedSm3rEKt+2s9W?=
 =?iso-8859-1?Q?9J6N1jFHj/DDXAI8ksj7Kq25wKa6enlWJY+rQCb31if8NwmIyG2d1WeMCJ?=
 =?iso-8859-1?Q?5FNapG5j/JeVhQLe4W/fAVEPCqERxobdL0MqNJDIOQiN25/dlGMUkBgx/l?=
 =?iso-8859-1?Q?SzjGj2Bel4t/Q0Hrb6b5T8BRP7R/BpdKFMyF8SueakbB6QUzGspdk8oOAj?=
 =?iso-8859-1?Q?31mX3HAf5Ou4M9WGAxuv5B1KBPV/54mRjoOAMEaVx/p3gJ5yQcWJzVBamJ?=
 =?iso-8859-1?Q?OGJssG604ZYFMB6nVZS7CnCmKsJEiXEpQYfKjAfto5yh9mHFDgp0LVpxxB?=
 =?iso-8859-1?Q?jGYUY2Y7CBfv/Owse4s2Hd25Ngee6fbjRxIKiJzxCfM55YfzqbC9gUu3tT?=
 =?iso-8859-1?Q?1KJagl4vLaB2+BcRT94TV1W7g11+gdva5PKuiCqS7dm/BVuzCXgrDpXZmx?=
 =?iso-8859-1?Q?vt+cOGx8k5sWkvd4v293ONkG6CWAaU1wscFQLXVgJ3Stgn9RowUd5B++sW?=
 =?iso-8859-1?Q?uFLzdwdF5cjezzTyJPxS+3E5psZhcaVDcRwb6dARwxQdfiNXlJfHh10mzN?=
 =?iso-8859-1?Q?QK4UMW/IfXI1Jxc0Y+KzB/Jaqvn4H0WJgEzOwoB+OGJTMBHylp9s0HYh4v?=
 =?iso-8859-1?Q?h1uR6IbGvNc5p74YBN0V4hJGG7N+V+dklS9mPCZRcMygO8xS6G+O4lsKml?=
 =?iso-8859-1?Q?M0SiG4e39TlgOWyF0omuHNgOKgjWf43JRSsmse/a+Dri//J+5ScdI+kMci?=
 =?iso-8859-1?Q?4MviweEJ/Urs0r6nnFqZG1klI/kKQRns46WdAcZSfT7IP27ping224/+MA?=
 =?iso-8859-1?Q?jIHS/rJOMua0YEB8RU1N46TSsJ2rofN5FOBnn2GB3nFxHcSTa+rGALcL80?=
 =?iso-8859-1?Q?v7hGp9RPP2WpDNLXAayat/gMURRWFwuVnqXlpn39KBnDltGE7U4l2v/RIS?=
 =?iso-8859-1?Q?s29nCVY155odiut39M5eQT24NQaRGa35FnlXedZkzm255YLfvZRnBJneCz?=
 =?iso-8859-1?Q?RrU8Ce+T2ETXtOddnVgMDwfwGc32S32+XzG1bGjlTklBRb5GnfowokfdUj?=
 =?iso-8859-1?Q?SRYC5ZYdmf/9vC9LyZx6qqRCb3xQd7UDKJRt0y1JLCmEsvyxYkNgdRU26g?=
 =?iso-8859-1?Q?qhKgTkjTjF7j17iwNmGtp04QBQfJCv9jq33ipNwe/v3qFEsM89nqmvOHIr?=
 =?iso-8859-1?Q?iBSUiLQ/qeuZi7gMCuKxid2LgN3buvpIIBqCdPVByGDC8F4hnuDw3PzVip?=
 =?iso-8859-1?Q?Xn270Q/wLb8d49v6zBiGiOdJN3SPLaKgxkw7vHPmCgAtSF85hMJ6w39P8d?=
 =?iso-8859-1?Q?J7+nLo5/RxRTr4XLPR1evXCS1Uq4Ytp0hJWgNuGIoISm4M8GOpb/O/C1Tz?=
 =?iso-8859-1?Q?nn1d3QvrPWyfsGbv9YRpnVwSlzzRDgSKYgk0r0oZg6pTP3WDsp6sHHA6VF?=
 =?iso-8859-1?Q?iRuDw4g05xau40b1BQjfbcwDsv5mYAb0wcAznbAuHtgm6ozj2yIDqHPb9D?=
 =?iso-8859-1?Q?3Iy6XG5fZ56MZ/VMV17Bhgy/Hra55PqR1iZr+WNSgS9JwVdvtAEmQ6uJni?=
 =?iso-8859-1?Q?T3Vj065mEg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: qca.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4567.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7464782a-5c30-479d-8c2f-08da423d83e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 13:08:39.8756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5z1nALptiT03MoXg1hVq2w17QRplZJnaZ2PZhEYFqQ1c+yc2s1y6eXU+Wu9ESKUmS4y9k2LpZy6VkfwriyR4Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_060848_502972_07D6F92D 
X-CRM114-Status: UNSURE (   6.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

Here's a new pull request for ath10k and ath11k. Here I'm adding a missing board file for
WCN3990, otherwise just regular firmware and board file updates.

Please let me know if there are any problems.

Kalle

The following changes since commit 251d29004ffce3462779dbd08073a2cd8dfd2087:

  amdgpu: update beige goby firmware for 22.10 (2022-05-16 15:25:38 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20220530

for you to fetch changes up to 82b0ef7166e2b7f9d12e7745a2af4e4c75c1aea8:

  ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9 (2022-05-30 16:01:56 +0300)

----------------------------------------------------------------
Kalle Valo (7):
      ath10k: WCN3990 hw1.0: add board-2.bin
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00157
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00157
      WHENCE: ath11k: move regdb.bin before board-2.bin
      ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9

 WHENCE                              |  11 ++++++-----
 ath10k/QCA4019/hw1.0/board-2.bin    | Bin 1129788 -> 1154076 bytes
 ath10k/QCA9888/hw2.0/board-2.bin    | Bin 133540 -> 145684 bytes
 ath10k/QCA9888/hw2.0/firmware-5.bin | Bin 693604 -> 693700 bytes
 ath10k/QCA9984/hw1.0/firmware-5.bin | Bin 681568 -> 681672 bytes
 ath10k/WCN3990/hw1.0/board-2.bin    | Bin 0 -> 461060 bytes
 ath11k/WCN6855/hw2.0/amss.bin       | Bin 4972544 -> 4972544 bytes
 7 files changed, 6 insertions(+), 5 deletions(-)
 create mode 100644 ath10k/WCN3990/hw1.0/board-2.bin

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
