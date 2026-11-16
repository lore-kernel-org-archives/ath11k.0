Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28197606A323
	for <ath11k@archiver.kernel.org>; Mon, 16 Nov 2026 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IqQz7e5t;
	dkim=pass (1024-bit key, unprotected) header.d=sunydutchess.edu header.i=@sunydutchess.edu header.a=rsa-sha256 header.s=selector1 header.b=s2cYc5mO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I2jUHuuNNh+AJ5mYvphm1Vmhxtjra84T9NLLmn2BRnM=; b=IqQz7e5tbyNZ8n7b147AAYpBIK
	5/nTHRxg6/x4yhIA38be8iJu2T8yOmAnS840szAh5FPAWwrHpG9gv86lRI1NKx8dV+VflaaSQLQ5W
	jJOEdic/MdsUzF53YeCjrlkfgyDaU2AaeISMxCRDDgXh68oSGAzkIOE5tf3a+ttO2Y9U+nTkUsXQs
	B7L4/K1YXnnmtPsDHOGE27fMFQyMS4skUwtoqDEJwWJC9iaUYqlZ0syvLBPrPCUJYlCEntJ2EaW/J
	xgKcEtC79ZFuEMyREIH6HRU0ZgBEC5ZjlnPqd2+gjZQ0d11bE5AuLKihI9hRhmJlYKeOYWc+Y5mo6
	lZyzkI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1At-00000003VKY-3iah;
	Mon, 16 Nov 2026 18:11:27 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Ar-00000003VIu-1m54
	for ath11k@lists.infradead.org;
	Mon, 16 Nov 2026 18:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNbWi8aJi6EUoK/W+SoinGjo+UjD43tE4zl/vejwOnd8h8qXk+IQ7aYOGw/KNTb+IQVe1Zl+/HrKOXLS9RaJiWln31GMInCooTMf8wT2YKB+5XI1VDYoRGLGqtBovhT9Msv0NqHvo1cXcdIJJV16lKPkAFrj6cVMpujhaKgEyIEdZb78wWgaqOowF+AwNY7Spi6i/nvkE78cWMAmy8RaJJi8DR4z+TG9sug5MW4D+SxGur+Gl/VPR8QCclMnzk+QK8tgVtaBugaoTLcN/63k8n1K1haPctsUN/kuFOkt290IxC2bD5yTT4q0r85u8hYqpKlz4AOrI3xQaT/lZFJLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2jUHuuNNh+AJ5mYvphm1Vmhxtjra84T9NLLmn2BRnM=;
 b=jsMcKWykslxUMEbYbs2U5rZFc0dN3RbgJ/gfCTp6XRCdim3rlfO3J83VdkSkLSIZISpIG0KL1ViHLOnUrZtGyCKg1DhsuNU/zFCpMZlZpNUadbPZdbYGxeK3gXWwUz+XY62iEgLFfw9V8Wt3lzjEWvI/jheACUWy3MCJvCrp3lRtI+/oRN3DbWRqAQ32Z+e7CgsVLjAmOot8h/iCBGHdPqi2dsKz8Ar0vVazfuukG1CR1ceJo6prVGH29z3ghlID0JphVW82qEMWcTLE9uHpH9dhvhWvLjgZ0eGPJ8nmvjBk4h5zkquW6/hQ6DZqeeBNg/cIWb/zJXM6nqYAibn1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sunydutchess.edu; dmarc=pass action=none
 header.from=sunydutchess.edu; dkim=pass header.d=sunydutchess.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sunydutchess.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2jUHuuNNh+AJ5mYvphm1Vmhxtjra84T9NLLmn2BRnM=;
 b=s2cYc5mO2ahSgrDF8wyVmxPpnaaYsTDG/OrE68DThtPd4ikw4NxwRSbmIM0/N0VDzdhaEpxU7muwKNBYOrH01jkCzYymludM0k1TOZ8C//ZcJdnVay5kylxcELvaZT+4cnbLHvDVY8Ge3YA6Z0pgHic2eRCwJOyZUI5ZsSO4bxc=
Received: from SA5PR03MB8425.namprd03.prod.outlook.com (2603:10b6:806:47b::8)
 by DS3PR03MB989169.namprd03.prod.outlook.com (2603:10b6:8:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.12; Mon, 16 Nov
 2026 18:11:19 +0000
Received: from SA5PR03MB8425.namprd03.prod.outlook.com
 ([fe80::ad3e:e026:f2fa:bf5f]) by SA5PR03MB8425.namprd03.prod.outlook.com
 ([fe80::ad3e:e026:f2fa:bf5f%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 18:11:18 +0000
From: "Ure, Christopher R." <christopher.ure@sunydutchess.edu>
To: "fernan.tapia@fernandotapia.eu" <fernan.tapia@fernandotapia.eu>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
	"jjohnson@kernel.org" <jjohnson@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on
 the same pdev
Thread-Topic: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on
 the same pdev
Thread-Index: AQHddfXgZGwzVBjsOkyw6KCqiIbdVg==
Date: Mon, 16 Nov 2026 18:11:18 +0000
Message-ID: <9744CE3F-114F-4A08-9A3D-E39DA7D06E1F@sunydutchess.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sunydutchess.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA5PR03MB8425:EE_|DS3PR03MB989169:EE_
x-ms-office365-filtering-correlation-id: 618bf7fb-a221-49ff-66d0-08df440d02f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|786006|10070799003|366016|18002099003|6133799003|11063799006|56012099006|10067099003|261102123227099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: 9z7ZVXt30UJjMiseDRTG7ycOGi42FTRd1WY+a0na1r5c2GYRiIa0pAjobn4nQbhGV481oouwxGfeCftvfpAskCu7P8MViTZz4iR7lGeEs3g8pVueLfNrTIgOGCQyPuuIO7ZwFdO3cED8uVvDVCQW6OmoHQl0fsPVJNmFOald40UR02WQsoo7lpqXSoUMuawQzdgtO+oK4DRPnNPCXJsfI1dtY9ZvbX7CHeCJ+RhIR05YpITX+57Z1bjTXgcJvBZzTi8eCzgCklPkQp7kn4oLKznbw93aS0UbA9GOXVdRLpUwBj3gqmRkns6gCPyd13iSsB7wosGoBOga6L13PszDF8YOQjtHI5h60wM5KHv7ZgtBlYn7NhdGrwGP0b8EiAbq5ChnnerDHARQuYpMRH2U1oo7kRi0KdJU2s6XraUuyeXONNMBtPE0tNrJE2oflWYgGQHLxQ7t62OKZMfp/XpXKtuH5ZO0jEcCuKz4j8wQEQj0jzNdyMnH0REYzjgiBayjKmCH5aizeSo8gTCuQdPWHcXX75xxfsQXTnv3DaCqu3+hGY8sMijyfOQq+oYGnQT+doNGeEVafc0D+dqmzvGtCuAVCK+0C3Bvfi4pa59EHVUAlBZFUQTivxi0/wZhfLkNlcEV/+F46IsT0cZAcRGb+N4bSN+7/oShmElXuRYiRbr4kWeL8NvL2X8uxnOHDIuN0Ir8W5ib4hDdycVrSzQizA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA5PR03MB8425.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(786006)(10070799003)(366016)(18002099003)(6133799003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261021121427099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vDkGGXGXhg84OclYqaSYJ3KrjvHdMi+2O2Xy1LOXR3b/V6RgWlKJKg3MPRuE?=
 =?us-ascii?Q?GpKbx7r3YI6iHChsYY30uocic8HRThvrplHzhPQuAFi8mDgJY/bWz3uX2T0H?=
 =?us-ascii?Q?l19vtjHVjLswctP15tFKd0ZUAd9rRLQxl1XKPOMk1gMaJbDCMr7R0j2OMCFE?=
 =?us-ascii?Q?ZpT9tGVuFtzu/Z2+mNEwS0E1CWUmJOG2BZXeFDD7rvbNsaOZIQara1R/O1sy?=
 =?us-ascii?Q?TrnXwbhWYwxN+tq9KocRbjE3wF9tfBeKh3amvT68DhkwQZmQ7jdnXdlIDK2C?=
 =?us-ascii?Q?HUtBn4yIt/HerHpNbcerAO6N7S60ihHwq5Ip4b/Hqj1XxKJS9LnWgxc3X/8B?=
 =?us-ascii?Q?aL7VU0KmfwaWZi/t8aCr3bBYdcYwWufoRKZPg19bm8icruF/eYFkkZk7ueXM?=
 =?us-ascii?Q?s+Z7aWvfhKNZZAJo+keYL79eF7e0PHXVlBUFa0wf4pWMjJ9N2+HCICxcppNH?=
 =?us-ascii?Q?vzJzdi4PYd9cvxS9JXncICTBATtAh0L1WVEdFanAn7LdypdT8lRvdZ/KLYIP?=
 =?us-ascii?Q?IvQE7sQaY1zE4I5K83eU4r7it3fJFkINiY/L2Thyyzu5li188HTNPjQBVOfi?=
 =?us-ascii?Q?uTnsDbckr/YxcnlajuI+Sh8XMTkvMxOUl0UHtDAG9GTK8LZmTI63ZK8wrdg2?=
 =?us-ascii?Q?eSRQ8CweOvwINNrt+jOXHWenQGa22kAT24Ez5jNLq7z7nsmMOF167hfwsQYR?=
 =?us-ascii?Q?UknsNBTQPB2342ox9IyH3vvB+Or8uPe7LUIho5Ymjj96mtpkgupyvkX8zjjr?=
 =?us-ascii?Q?2tymZP2p6sLskF9kxpEEbEtZCQhKoKioRR9C1/M2TD1M+/e+q3i9N8XfNo+6?=
 =?us-ascii?Q?TxtnE/f60Vih0VxpxWRSSPBK3v9O4ISvdIGHq+8KgLSgMyNoLC+693W8Z0gZ?=
 =?us-ascii?Q?tGYV8z8ex3ls2anjdYYlMTZ3sNFQnbftcTJeiOHB5+JR3Zo+t4yRq+f3/ZLa?=
 =?us-ascii?Q?kNZVhZar87Eodx6mrW+0NBn2Vao99lPdHfuI9gJOHeZx7c+GokdbJEThd4HK?=
 =?us-ascii?Q?M3sQ4HK0pwbTCx2R/f1BOFlybGnylv87S3yZ7q3yT0UW/j9CPAvFjX0dukdH?=
 =?us-ascii?Q?igyDW0kHuL/1KmewRa3s6d17436Ul+dRMAQsLzI+cTI45MLaWQYIucj3Uy3j?=
 =?us-ascii?Q?Kl0GVun4tjL0Qypet6sMWQLnl/wyrtfNTW97aS+5QOmbY2n4aYf0kyVEkHWv?=
 =?us-ascii?Q?Ds/VjPJxLP9LOCQjVjjOVlzi/H/iJlX4vTfKBLK1TRvIKzskCZUYYr+YrtTU?=
 =?us-ascii?Q?22M3Jw0gBOKc/9NDiux+oTep40ckvQ354SepzCCewV3RN+mraLYQ0Bpfv9Fu?=
 =?us-ascii?Q?i7Wjp4KJbCZbf/nKJgQJnvj63OtaT4gdPmN1pOiUOv3VomUpT/PO7O/kxH9T?=
 =?us-ascii?Q?dTYd5EZnjDgUkDQ7fe6C5xeSTCv6MDRjVvtJRqcWWpGUTWGbQQXHlxP8dQVE?=
 =?us-ascii?Q?rVmp8Iz0pnj8QgXcNejsc786qJ7c0gYYaTnt3KVDzoKvExNjWQreyQhLeiQ3?=
 =?us-ascii?Q?3yJLumETtMmhs8RINvN9eTdlHM/jquBo05BKsK5nuXqeUbq5BPg9cPF+iJdO?=
 =?us-ascii?Q?QufWf3xyKWrBtYiwCnlRIkmljnLr9NjWPpFSSlHsdCgcYUocMPOc34o4zIzK?=
 =?us-ascii?Q?bEka1g7syPwzpELdeWGoxXxK7mrvu/spSYORBt0S7TZEpFA8Aj+Ky5L5FxSE?=
 =?us-ascii?Q?yyrTSoEBta9yz4OVOufynhGKem7GsJk0KvNi5KIAaIefnD4mi3Sn7NAbi6pf?=
 =?us-ascii?Q?FW1YppA/7mwHXYOmm8qvUdiTBItXAeTt4i8e8zggJnpAni661ipB69cufG8J?=
x-ms-exchange-antispam-messagedata-1: ERJCepL2Vr7U+65UYMqh4tjE2fb15eAyOW2q3ma/l0VCMZTc8W9wooNx
Content-Type: text/plain; charset="us-ascii"
Content-ID: <413F39D44F759841B239EC113AEE70BE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sunydutchess.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA5PR03MB8425.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618bf7fb-a221-49ff-66d0-08df440d02f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 18:11:18.4436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8f5b3bd5-b312-4dde-9df7-41fa4bc1d9cf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3l/TYU2ycfDk3SCyi71hrb/qXu3wVkzyC8qDj7iWC4ujk2gJ3Wr5pOnHf5w2H0r3eWI6YLc8eImU6Y8SEOfZ+Yim+zNDcFbgi4HIZUE0+iu6zvG4oAHSPr5eUawXU+D1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989169
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_101125_475542_4664AEE1 
X-CRM114-Status: UNSURE (   4.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After modifying the build script to target 25.12.6 and applying the patch t=
o my devices, I was able to associate a Tuya device that had previously tri=
ggered the bug.

Currently at 2.5 days of uptime with no issues to report.

Tested-on: Linksys MX8500 OpenWRT v25.12.6 kernel 6.12.112=

