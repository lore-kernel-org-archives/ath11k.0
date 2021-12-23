Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC419C433F5
	for <ath11k@archiver.kernel.org>; Thu, 23 Dec 2021 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=woFWacxobOiHM3OXBcTKCNcHJrC1FINeA7fro+HFaBU=; b=ND4iDgEYjzYoA4
	EijZB5dx2iNWFGJi44ggYTEvCg+wLvqvqmZn/6Dkiyei3dKOIfLtkZCPlY4DSdgpat2IVj9kfX1GR
	Wv8aN0QS3utJLFqodHYbJa+czQc2V1KK/M/IrY2xsVRp7onB4k5ujdTcnFyRivmGDYmKWZ/zJAeCX
	58FiUdY6en8qSJr60RumZXnzNrbnzxKT23pZRyFe1fCZ8P6xwqMiv/9uRoONRJK7gjNlkVD1kpyWJ
	bXf56QeAOerf+Y1sgD5mXht4KiBVXG6dy1/7Xh22uPTJs8jehe5C/A2kGaHNOwz5opQ6d2wXIYnMP
	EtV1m9uZygL5bFZlII7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Ogc-00Crke-Vm; Thu, 23 Dec 2021 14:03:15 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0OgZ-00Crj1-E3
 for ath11k@lists.infradead.org; Thu, 23 Dec 2021 14:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qca.qualcomm.com; i=@qca.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1640268191; x=1640872991;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=FRmr1C6nFtzjaW/UXd0VZc1SpInOML9TQG3oOMQLevI=;
 b=t2N2db0zO/R7DBBNlr8utWLf6RsCSfJlmklVwYrI6jBsfWQzqXPnPd6E
 Wa/U7sphINrzGcyGWY5OujH456bvUmfXSj166MVb/noGV90XTkCO9hGn7
 US2aO4O/+lr8BrMTcX1uLa1XitDus3LZIUbg6P8F2sZurziqQ4HKswFr7 U=;
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 14:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHtNp89GMDnv8Pvx0gmdNUYBbFdxrrDNFSkZp/+1NSZrzGsM911bKZrypXXSWclYzDOMKKSKeOSqy8J67SAMxU4OPEpyw6b8WinIKN5rA/eH5DitreWDtqEidlJbZU8AUglV74x/Z7ykWRJqmTT9c4bOwVYpdqv1PkEGb2ITSZPkkhRcHtGATgaZRUhnYwthLdcc/kQ1cLEWpSk7bt+0zLnBnSKelkidt9IfjfY4bQIbRl5IQE4/HMkAgUBIaewoXsjrqHv5IJwXP91Y5Y/5tuzln8t840swYy+AnETTMZzfYQnz4kfNRi9UD+vP+smrj7Ya6e2MisT6aGn8QpJ0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRmr1C6nFtzjaW/UXd0VZc1SpInOML9TQG3oOMQLevI=;
 b=ESKA32pDQbNh8xOW/XPT26Po0C2pn+5/7YDxAucj1aLVZmjMB93xtLe/tgBPXqTxMc500CUFE3qLhvWF/cKpcn71/2BIbMqNt1GXDpedfxCH2Dqd8M9imXqojEgvjMdbPTmVy0GWDEA8jEt2det0nO9nCMN05ixEEpM8q04x8pFSYIGGNE6717QPMd9Dje6lbHRn0eVo9YPTMaVrEftd9IoOW5ntUUciqCilzRwallsII29/VnKY/81F9oc8Skm3L/ZN6dCM5U2DEAUNXEVvLeZC8pNDa/UOOsclnKjgBENN0qEh5a9scBWYCPa2ZDpx4rECXGy5/PrCmJgfcxtZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qca.qualcomm.com; dmarc=pass action=none
 header.from=qca.qualcomm.com; dkim=pass header.d=qca.qualcomm.com; arc=none
Received: from BYAPR02MB4567.namprd02.prod.outlook.com (2603:10b6:a03:5f::14)
 by BYAPR02MB4792.namprd02.prod.outlook.com (2603:10b6:a03:4a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 14:03:04 +0000
Received: from BYAPR02MB4567.namprd02.prod.outlook.com
 ([fe80::b140:3a78:5b83:a1ff]) by BYAPR02MB4567.namprd02.prod.outlook.com
 ([fe80::b140:3a78:5b83:a1ff%6]) with mapi id 15.20.4801.020; Thu, 23 Dec 2021
 14:03:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: [PULL] ath11k firmware 20211223
Thread-Topic: [PULL] ath11k firmware 20211223
Thread-Index: AQHX+AUped0S6n5mAEqLEocSOh1M9w==
Date: Thu, 23 Dec 2021 14:03:04 +0000
Message-ID: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 730ea720-1877-34b8-14da-e4b642770d28
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qca.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b11d7745-2dd5-48f5-a38d-08d9c61cf067
x-ms-traffictypediagnostic: BYAPR02MB4792:EE_
x-microsoft-antispam-prvs: <BYAPR02MB4792D54440E1567744E764DE927E9@BYAPR02MB4792.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RdJdr0Mr5u7uquz+y4s7avhmfIt8a7XIApby08T0TBrmY9hFqqwREzebO0eR9QFPDzGTVosUpD5BpDiLmh4lDQFk15A/hI2s0LU1MdifKb54QDSkCiWQRfxilvZ1q0vWOAtWu/TONgAKzID0rkQxMcAt1MzTovc/+0T1tEcuBn5ChHV02Qs4SpfXS8164fX3zq9AiE1MWiFi6uIHXo2xf4S76z/0sZA5inDDJ1Myir8Z8iy67VajrhQTp7PJY3+3X80sy4GYscBHNKwsN26Y+a+wCn5JKHFxr5m1TppfXwBcw8MqjP8w0B2eRKnDjtHJBQq4wMUAu3K513X8xAkql6VKltHadLDSlRvU+K2tBQ/0XZCb26x/zr4QdxP21bpLFk5+zq2VEvdf/dYc0/agn9f8Pk0tZbuG+edCBQt/p7qnvAqyhQCGwqGsSjN/MTRrR5kd9dgzFTBu2gd5fCnSUVOm+n1pl8SyDWsGDnhDpCZMM5vwcOjjyOGwMoh9dXJrnUhggaMN3Yf9iugTVQIPkWvmrHD/+rFqySQ3yZAo+KwyDG3iOk+7WPxOPj2LAIO8Bs/GBZ4AJ/uEXvTBJB2frC5z+jUltKXdOapIkkvpAv/U1QB6y3fpH9pZpJOjG9aNFp1JWdAgPe11u9IeGK+DNDZ0nAxLeYNCE8i7G0iiSvanHdqJbxO+jcsohWcsNvC9PTuOoiNFxwzPHTJo99ucPLSRXmfdl/GVc/8AdmJJakY8FEy7uS82ax4+VAxqFm9jBbLH6BueIhNkX8wc/sj1x78QWJJxlCVzc4emFCnUIiU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4567.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(4001150100001)(52536014)(4326008)(66946007)(55016003)(71200400001)(8676002)(6916009)(33656002)(26005)(966005)(66446008)(66556008)(76116006)(91956017)(8936002)(64756008)(66476007)(9686003)(186003)(122000001)(38100700002)(7696005)(316002)(38070700005)(508600001)(19627235002)(2906002)(5660300002)(6506007)(83380400001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1sGpwbIHzhCtVFTX2E5+mPqYHXpV7ysJZCmZxXpJZfNgPaKB1Z7Wi8VI5H?=
 =?iso-8859-1?Q?jQS2KKjRM7XW9brYKvyu6mYe3C3PoZSo0gZM1ciwrODXDqnDfeiamR5+2Z?=
 =?iso-8859-1?Q?WVDVEbStbE3Kv0EmFFIOA/JoTnFLyZHRWTjNa49mTfdE5piWMJvq1NXEhj?=
 =?iso-8859-1?Q?6X8vCmHxgW9XC6V7LUski5pz8dQVwPGAAFZ6nLQKi+wmrDKwdEbR3v5QDo?=
 =?iso-8859-1?Q?XiHEcdR2Fz14ZdYtMYzAnBfKsGsSy6vGN7InbWGOPY7ElEry0fe8WfL2Yf?=
 =?iso-8859-1?Q?NMQduaksKpvZ5IonWAAngLkukVszsSAev/kQP8sL0ui4Nqxwe0fwDAn1M3?=
 =?iso-8859-1?Q?Xii88Ji9zhzFC7Y7fooFBDmYrsW9QFFRHOn7VA+z2GWDIv44BD4gqCejhC?=
 =?iso-8859-1?Q?B69LqKCh7yW45ndwQuSXGREemnonKbWYbvo34oyCz2nOhn5X31ApgnuSBE?=
 =?iso-8859-1?Q?ENY6lciQEFSxPZ/VRbw816Ge8r33xCTGoVPXLagtvXZbnX6y30vBmjMlV/?=
 =?iso-8859-1?Q?34sFF/G/pms+H9eNVPf6zL2LlOpmRT+JLXlkCgPRmty6YaSL8THgyDQPcD?=
 =?iso-8859-1?Q?dIt3HvS+B3lKDVhgW+8AqP4dePKMEyya8NvKJcagXFrKeuaLsTNukIcCyi?=
 =?iso-8859-1?Q?oqS/txAOvcaY2uafrzq/SdRrlUdzxV6aEYosr7UCZLX7lt3wCrrIkJx8gr?=
 =?iso-8859-1?Q?EjucyxBMtP7A6g+W/nN6hR1BvHUGWZCrpTIFdyyJ/PLgPSRuAuZDnbXcOr?=
 =?iso-8859-1?Q?ftJS0q9QbmPuHG0u+3i738+gwx1Q9MfVp+6um2DGpKzEJmt8nbeuq+M3GT?=
 =?iso-8859-1?Q?HrHoP1G6bU+TSmKCXIxyWskV4hSslFlIYKnzIUO6PPT2W1ntK2LS1RbUz5?=
 =?iso-8859-1?Q?gMclpRCpMeqmtkmkWFigocOPshcL3yVeeZVHoD+7phnd8aRbk4VlKdK4s9?=
 =?iso-8859-1?Q?PmqVQ8SuKWzI5YJcGlaG1qwC+GiD92aJ0dErPnImx8VydfDSdGv6zfo02N?=
 =?iso-8859-1?Q?uHnIqy2ikUmHFXvVeP3u+rd57Hw5tCr1wzzUO4V99RRkpG/zzTCsR1cCZt?=
 =?iso-8859-1?Q?aqocghM/tToNgHJJM/gd+eD1tQ0uZ8U0ulLIqkxp4JUG1K84D7eFkGg2Vv?=
 =?iso-8859-1?Q?SQgdUauqjH4LqjwmokSybxnKQ7Ex+t1KtqFmjzAG96I5yb3prZJ3JJtxHf?=
 =?iso-8859-1?Q?rtrXI0VheJMO+RVPiYGNMacXsN8LS8WaMBNV6t8tFO49eEVwfM90/LnLGK?=
 =?iso-8859-1?Q?56HFTthidATnj7bV5yAH7xD/Vd2IB3xhiIfYZih14vfkSEvV1N0sqv19WI?=
 =?iso-8859-1?Q?QAmGbaC0YjSs/lwWVf+6vebviWu/Wi1CE2Yth9zf4ga0Grwu3XTCuRJ6sK?=
 =?iso-8859-1?Q?Jj2ngLRUvFLAdrA69RQaPtKUKFS6jPAepUy9FbmqzJNm/nOMJd1NuEp7Ra?=
 =?iso-8859-1?Q?QF30pW9HUEEz3VLq2wP3QAQ9oXL8a7Is5RpEtvJKnD0zKqPE6eWnuQQF56?=
 =?iso-8859-1?Q?8boWLUqmtvlDz/HPZxt3GDl6LCkobNvCDV8bQDwzUsQVPMwpeGbt2vIVaH?=
 =?iso-8859-1?Q?MzO8mMnO6aKAFVIf82somoG28Ta8YTKlcNS+e4a2HV8t8FcOZrF5kXc9i9?=
 =?iso-8859-1?Q?WvhYql08TeO6Q9AicpQfeyIPLA8vHQFBYqsaC3fJA6kcd6Eqveyfgy7g?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: qca.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4567.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11d7745-2dd5-48f5-a38d-08d9c61cf067
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 14:03:04.3044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69cgco5YZ7R+8tYgGdRuAox3pjy4iYTE1GgSzYIgqeP5Y5dh6y6TTfMcDYOwu56hzrZdUzbMZ4Z/11LUKcOPig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_060311_507688_B2C5CA23 
X-CRM114-Status: UNSURE (   6.34  )
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

Hi linux-firmware maintainers,

here's a pull request to update ath11k firmware images. We have new hardware support WCN6855 and QCN9074, but also updates to existing hardware.

Please let me know if there are any problems.

Kalle

The following changes since commit f682ecb015df087613f91872712eb6c0f6c998a8:

  Merge https://github.com/pkshih/linux-firmware into main (2021-12-16 09:42:51 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20211223

for you to fetch changes up to 0f161f385f3854086b4fdae2dae786ab6bd3efa5:

  ath11k: WCN6855 hw2.0: add to WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2 (2021-12-23 12:40:55 +0200)

----------------------------------------------------------------
Kalle Valo (5):
      ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
      ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
      ath11k: QCN9074 hw1.0: add to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
      ath11k: WCN6855 hw2.0: add board-2.bin and regdb.bin
      ath11k: WCN6855 hw2.0: add to WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

 WHENCE                           |   14 +-
 ath11k/IPQ6018/hw1.0/Notice.txt  |   48 +-
 ath11k/IPQ6018/hw1.0/m3_fw.b01   |  Bin 6712 -> 6712 bytes
 ath11k/IPQ6018/hw1.0/m3_fw.b02   |  Bin 294912 -> 294912 bytes
 ath11k/IPQ6018/hw1.0/m3_fw.mdt   |  Bin 6860 -> 6860 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b00   |  Bin 340 -> 340 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b01   |  Bin 7000 -> 7000 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b02   |  Bin 4696 -> 4696 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b03   |  Bin 2357712 -> 2557456 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b04   |  Bin 370560 -> 412192 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b05   |  Bin 175588 -> 197988 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b07   |  Bin 8936 -> 9408 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b08   |  Bin 409914 -> 452780 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.mdt   |  Bin 7340 -> 7340 bytes
 ath11k/IPQ8074/hw2.0/Notice.txt  |   48 +-
 ath11k/IPQ8074/hw2.0/m3_fw.b01   |  Bin 136 -> 136 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.b02   |  Bin 327680 -> 327680 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.mdt   |  Bin 284 -> 284 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b00   |  Bin 340 -> 340 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b01   |  Bin 328 -> 328 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b02   |  Bin 4696 -> 4696 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b03   |  Bin 2589264 -> 2934416 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b04   |  Bin 985504 -> 1009760 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b05   |  Bin 387076 -> 243588 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b07   |  Bin 7048 -> 9816 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b08   |  Bin 424524 -> 485768 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.mdt   |  Bin 668 -> 668 bytes
 ath11k/QCN9074/hw1.0/Notice.txt  |  802 ++++++++++++++++++++
 ath11k/QCN9074/hw1.0/amss.bin    |  Bin 0 -> 11897676 bytes
 ath11k/QCN9074/hw1.0/m3.bin      |  Bin 0 -> 340108 bytes
 ath11k/WCN6855/hw2.0/Notice.txt  | 1504 ++++++++++++++++++++++++++++++++++++++
 ath11k/WCN6855/hw2.0/amss.bin    |  Bin 0 -> 4984832 bytes
 ath11k/WCN6855/hw2.0/board-2.bin |  Bin 0 -> 721328 bytes
 ath11k/WCN6855/hw2.0/m3.bin      |  Bin 0 -> 266684 bytes
 ath11k/WCN6855/hw2.0/regdb.bin   |  Bin 0 -> 24310 bytes
 35 files changed, 2382 insertions(+), 34 deletions(-)
 create mode 100644 ath11k/QCN9074/hw1.0/Notice.txt
 create mode 100644 ath11k/QCN9074/hw1.0/amss.bin
 create mode 100644 ath11k/QCN9074/hw1.0/m3.bin
 create mode 100644 ath11k/WCN6855/hw2.0/Notice.txt
 create mode 100644 ath11k/WCN6855/hw2.0/amss.bin
 create mode 100644 ath11k/WCN6855/hw2.0/board-2.bin
 create mode 100644 ath11k/WCN6855/hw2.0/m3.bin
 create mode 100644 ath11k/WCN6855/hw2.0/regdb.bin

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
