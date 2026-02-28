Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666DF1048925
	for <ath11k@archiver.kernel.org>; Sat, 28 Feb 2026 02:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcWr4izeWMQs3eJcRBdNFRm77DFgLevZJJdj6cbHxfQ=; b=J0oXKulFskzVQLZ25U2fyRAX9w
	o7ZSL2FZZkxziih6Ezy4u7Jo1zirKghd4qhUDzUVZkJV/ZWSBOYveq1aRk8Axsv4EJ0Wn9W5q7ZPf
	KhWoYOJ29FYZiAYRnoHbRV77v8mPAXodko8GnQvsLiA1jgE8Ibq7+fPFj0Xbde6JTcMNt/ydQZMv2
	Ur4t00YaXITSkupJNDAVbixjJ20bEyrzdsVevJztSbIt4IA0KSAdPLQlsfs+kua0j8m5oowAOmArb
	osdQ6Lt0MC5d5L9U6p3N9+Ga37Mv83xhFdErGMLZqZNc0JJX6OqivKTJl5wWsTGtR5Bx/P2wjsGbO
	fRQl543w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwA1J-00000009QXC-1Chs;
	Sat, 28 Feb 2026 02:25:29 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwA1G-00000009QWB-3mxP
	for ath11k@lists.infradead.org;
	Sat, 28 Feb 2026 02:25:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULZPs6WJU5wz3zkkiNb97e45SQvmWgvg4+Ldh3UrmiQx8+WttbM+bS8q5uvGL8OZrcKiNGLLbowZMMz7lAtwMyrkaSmsrw24HWZnk1DqmgArJ/hbx6eXRb/v+dKyIfvLBLJ506yKl3gK1mMvvXxib2RpCv/RzE1qZFlTishEyF4JdADEnIOeBqiTg4/PVv9pW6ZHTpfyz1uU9cdonsNlsthiXj2bJEPfHNYB0fEOFft/uOiSomhWmzcHG1cjskNr6zpuLQK2jBfLybHX+HoOwTMIvDB06nTEcPyc3srAonu/epS2JxOeW4z6FBZNHF1OJwe3hpJp02fDFJlZOzAftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcWr4izeWMQs3eJcRBdNFRm77DFgLevZJJdj6cbHxfQ=;
 b=fkSpmwTsPrban81wfRqByqHiCY2OmBTIAcxXwp1p+Cyy02J2scvoFFKnIftYjU+E5nQAMPZCJ80FLATRRbTohDTF6vKHSJcfOYWxsHQs7uy24+gHK3iX5WcNI1IKwrPg5IqPcs3MWcPOA+rvSeyKfA8Gt9h8b4IVQXKR36J5Z+OsIIHBqY04iQ+4kRbn0ejwIdKn4oFiOdXMjj44kWoJ28U3av7M8oytaqoVLrbl+EvKJXWw1v4ZvxpuCV/DyQ1KS0jvXRIiIqpVnrYn4uIQU2YU1ERPoUYZVw6/V5Py7av2wIBKObveZW5PVxQzP/g9n2YvdQ0Uf7uUJVSIGvEaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silexamerica.com; dmarc=pass action=none
 header.from=silexamerica.com; dkim=pass header.d=silexamerica.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silexamerica.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcWr4izeWMQs3eJcRBdNFRm77DFgLevZJJdj6cbHxfQ=;
 b=1D45iWskEh3zQ2IMtbFp2VV5qgTJGrq1L38tEsHQNjjBjuj2leQplvZXiUkvMKcob8BtXfQtAyaLn9eVNMoHBPQQShdZtbPalP7+ZOU266jixiImP2YR9IdCptNrIgqdgbHMYbu4EcgztI+awFENXK3eAt9YNe9A2RljnxLxEXTQkvOvXNRdUeEUZUDjzzLznvuyoZvGUfWvqUhQXO31FSK80aT9h66kVRpd1Ykbakvif+iCixo/JiSCV1Hw7GTWgmi80EcBqkthmkacBmkKFUjOdZhrq1rVfX/aHmef8OmrA6zv2OKkDZZZ+OBlQ67lZY/3Nmk4oft5yw/FKdoYvw==
Received: from CY8PR19MB7643.namprd19.prod.outlook.com (2603:10b6:930:7c::8)
 by SA0PR19MB4303.namprd19.prod.outlook.com (2603:10b6:806:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 02:25:21 +0000
Received: from CY8PR19MB7643.namprd19.prod.outlook.com
 ([fe80::29d0:89a7:16e5:b1f4]) by CY8PR19MB7643.namprd19.prod.outlook.com
 ([fe80::29d0:89a7:16e5:b1f4%7]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 02:25:21 +0000
From: Dawei Chen <dchen@silexamerica.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: A question about supporting the QCN9072 radio
Thread-Topic: A question about supporting the QCN9072 radio
Thread-Index: AQHcqEobxzTDjII7VEOOSoqv8YhDc7WXYe/agAAAMS0=
Date: Sat, 28 Feb 2026 02:25:21 +0000
Message-ID: <CY8PR19MB7643FC8B2AA5ED9707EB479CCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
References: <CY8PR19MB76432CFEF9F0BF8862EE4D7BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <CY8PR19MB76437B84E62BF9881F7DD48BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
In-Reply-To: <CY8PR19MB76437B84E62BF9881F7DD48BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silexamerica.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR19MB7643:EE_|SA0PR19MB4303:EE_
x-ms-office365-filtering-correlation-id: 684c3f2b-5def-4463-edc4-08de76709f7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: En1bX8e58Mhcn9mi1f/QNbAFan+lNS4PfR5HYkqL5eH1QnDdAjaHE5z/U5ycNdOLHLO533k6hZcF3ZtkFGUWZvIf2rVa6eVjYdIUBK755MgQ6i1MjBICISljAY4ANy17879onpkHwwlKns9GTSZLpXQiKWlfmQl3R9jGIymbFbKA3GLUyUswjNUeX6yNjl7sFwkbAvcWQMxoiD48DyD84Rtx6btXoG1vE0irhKxBLkKxEOnNQKFDPAzncxvoovCNmM+O+lVzpCD2d5Mj9IQzbgzsDLjg+bh5mH0GTvfKFrLQYe62NmRxpH2RbTbVvmlcEyHtNoM69IyCFcTHPqxomw0dJXnQFGKMSY7QLzP8QNtbtp+uF35JJa6cimc7yxTgDhyAqE/Ucgby0BF36NNrGdyrdIcLR+QKZ2H+TYe8D5ujh1bQjcz4dR1FoSnDsdPWBkBbD36k5CJ3qekAeemUpmTaqq5OL8R1+gxUAOmbxcadjdCym5tghxEvJQRZJTeiTCnPFm/D9joy4ElOtfF2I/XMhKIQuU5MuceR2YIfwSMjMs18geNdDK17U3GVc7D8BB3Mgqkq6MVS6OokponoSlwblwBYileaf3p95qHIpHeGb5mLBmpwcfgLtfpDFD9HImzXZsvkV8Hx6VYDqtdFPSMByBAQeiq70WeipaVNWQ8e56AFvf5okf02hMGDe/DbrB2eFqGE0QuY7fPeEvF3JgdGXnciVb+eI6PB5w2ZbopBaUlLahXqEYajnOGK1LtS1iqJBtsYE2YX8ygqEhro41cHMARCOqMYK/aqLFiEvpo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR19MB7643.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A/cvpajn7TA3/VwcDpQ5wK87LovqOVtBpLLq16/8L1EvkslhdXxv6Kzi7I?=
 =?iso-8859-1?Q?UjhlrD1RviZUHH/01TkCCJixwb+VBu+cX5g0iUz+X2wkPK3Unr8OCqDx1n?=
 =?iso-8859-1?Q?j3CxXjRSv2iITo0rJS7G9IAFgId5Nb7CZO7V58TmSw1yu8x2Nfg1eDVZUr?=
 =?iso-8859-1?Q?FdBwrGT60jwj3Hf/nn6GkxNi3NtFMdRh4zRDqMwjy5ErI6PE4icUa0JEmi?=
 =?iso-8859-1?Q?PUmhrvzTi+bORPHJVplGTG+4Y2NrppArXyq6ufcWCjv24IcDmPgle4QxBd?=
 =?iso-8859-1?Q?W6oNQAC3yP58rQmdocXHt5DPy5Wb5RE0auPl5bWs+BfIpnT+t/eZV+LbBh?=
 =?iso-8859-1?Q?uEsiTrusiYAUcNIs86B9gTk4Jq/yhBRIRjDieAbfzabIoFk7CRmJiC+JQQ?=
 =?iso-8859-1?Q?WYIj2xvE+uUlpVpc8Gl7uGpjPvUYLrd2LZRKJfYkS6gh8PMjNQQzg+mprS?=
 =?iso-8859-1?Q?WN59PeD79X0ZGn50ala6jfVRTK+tBfC9chHN8kLNudgxaiaDBfsujt1Ejx?=
 =?iso-8859-1?Q?h79ikgW9MTMbeYbp9gAadHbrQ7b6tA82KtlRJzyBdSULzpifUzzMuXeIz/?=
 =?iso-8859-1?Q?tJsst1Ni8OuY/ySIy35MQZrLfvyHEJk+wnTnTQtMI7Xpwx9ED9Sqy0Iyzn?=
 =?iso-8859-1?Q?njyEnnJKXMps+86+OERTYdddRbeyl/KNFLZBHl3aTjNydnF0SysdYrP3bB?=
 =?iso-8859-1?Q?Udoyipra5E+HPfVNwrpIeq2j+49Nzny6BSchGkB6NlLcbDKWa+SwaDgNO6?=
 =?iso-8859-1?Q?16eIgmJtiAFIBs09B41iCxTD+WhDNf8Ec32hkBSr8XUd0uy5413+1QmWpY?=
 =?iso-8859-1?Q?iwa/8CnBV09x6cFZuBHE0AOMSY1HvIXU2SpDUuYpDmtbd50rnGsNzIFUG7?=
 =?iso-8859-1?Q?T1WSfsqtFIkgr5uY2oDZ4rWswVWLYNhVYIKiMdjxLZswIQitkc9zKO7UGk?=
 =?iso-8859-1?Q?LbntFliYNyilRl1cCRSSqXjZY2o+cVb2tWgRBiTQdHEkm6SXha6glISF2d?=
 =?iso-8859-1?Q?bo0WXMD+eRQh/qy5QbyperRaJkUp8Ljte0fFmL2aAJiPfSYev+f1/yb7n4?=
 =?iso-8859-1?Q?mQTIQDWX72mbFuZ8l1iA8Dfjx+SFSI7+ahlMlen35RiDqT4PyiukztPNMO?=
 =?iso-8859-1?Q?nTf1dNSBc7St8iFcToOjMfc1N2Ea2hNPJX0MnDI2n8TghanWUGipJ/WGMg?=
 =?iso-8859-1?Q?wYqt2SnpZu1ucPXGIIYtMxHyVN9aOM3cri6PrCRjtzOuWAUKDME0Fstg2G?=
 =?iso-8859-1?Q?FleYBrk6/2mD6+x7Dji6fZ70WprBL8A6oMtxE+fukF8vD78TKfERFOZ0VE?=
 =?iso-8859-1?Q?30trweryUhkimefS+zt8RL0AIxiKhQwqUQWr3jm9MziVMhv1g4oGivplvy?=
 =?iso-8859-1?Q?HGEoW0B8sF+fIaEVgPB43xl6ePRxJjvgQeUYUpO8EhHEgV/Qez98VWF8zl?=
 =?iso-8859-1?Q?JKGFke3e2fG3bxsqENOYSn9cppvbfFKdkh/StqEuHKARrMkzOBupCghhxd?=
 =?iso-8859-1?Q?PGuj0pMaj3B5kLSgYfg2i73EIn9hjCNTtnxQPZgOw96uVjTwPuq/rvDBYF?=
 =?iso-8859-1?Q?sQOLHaqF5AUPAxEZrGRc/LEKgFm/74I4pRXX8Cu8zmoxVav+hNtaiAkeXp?=
 =?iso-8859-1?Q?qSTpQD60CSrYNej8vnGqJwijDxzN5kaZJ9//AQqJM141Ggih3cow/KOsBu?=
 =?iso-8859-1?Q?9tWH1F/7QO77/P92xEN3XPvlFDGXqPAcTvnXOfiTkM9S0h7haLdGsk+aB/?=
 =?iso-8859-1?Q?mo/sTfV/horbwY6gqkWcUZ5FqTQfdmEcafNBEMSagoIs7sdb8xF/Ib0aSE?=
 =?iso-8859-1?Q?5cxKdk67bQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: silexamerica.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR19MB7643.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684c3f2b-5def-4463-edc4-08de76709f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 02:25:21.7239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b6aaf860-4a59-41a1-b5af-737a5a27e33a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98grgXvtoi6MvTpnWb08TgpN129GO+DVuIyYdzFhxfKsuwh+QoFy3Lz6GJBI60L+6ANl77WApTwOsyqag5FoCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4303
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_182526_946468_11B59CF3 
X-CRM114-Status: UNSURE (   6.54  )
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

Hi ath11k team and contributors,

I was wondering if anyone could confirm if the latest ath12k driver and fir=
mware supports QCN9072.
I am interested in using this radio and the openwrt stack for a router proj=
ect.

From my research on the internet, I have not seen any information that expl=
icitly suggest ath12k support for QCN9072.
I was wondering if someone could provide guidance or opinion on this QCN907=
2 radio.

Thank you so much,
Dawei



This email may contain confidential or privileged information. If you are n=
ot the intended recipient, please do not use, copy, or distribute its conte=
nts. Also, please notify the sender immediately and delete this e-mail from=
 your system. For the full disclaimer, Click here<https://www.silextechnolo=
gy.com/email-disclaimer> .**

