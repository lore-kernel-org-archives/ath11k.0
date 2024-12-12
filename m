Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30714E7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 03:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uF0N9D6B9slCc75+xF4FlY66DB5sgYc2lJk3nqZs05I=; b=S+5aXx2M4xhJy/TuJgGYdQkA6k
	PVAk9wsCsjARos5eCrnrTNZdngOJB9g1XHsClnGvDJBJERb9Aa6gF4RoA85wws3rzJ2keN6jhsQtc
	bYX/eWkGYfy9HrgrcwCxtPcAa9J4E2kYmtxFRHXf3r+5F5d6ynA7KgssPia+ixEjRZOaIWkEiE8qP
	SoIfke5v97FmKUeo4OaQrXdexDH9Xg/HVTNnhmfGMtQHshPO9oOTjNPT+824wdQ1mO+MSZo8ZLw4f
	uEK9OAWEJF++JUDMH3bHK4Cgi7Mi5BcVDICj3k9tCEbqWPIdINitgEyN+g5GKGLy0eELlpWsDtBim
	2cUncVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLaEP-0000000GqFv-23Dv;
	Thu, 12 Dec 2024 03:51:17 +0000
Received: from mail-japaneastazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d405::1] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLaEM-0000000GqFX-3sL8
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 03:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uF0N9D6B9slCc75+xF4FlY66DB5sgYc2lJk3nqZs05I=;
 b=iT6PVdX7TmpCcQnk9o5/XRYpCGOph7JXJ4ABsU6yiAHopTJ7Db1Ehowav6RdAcMl4jzQDPCphUnu1hs69J2dfRvJBlbRJYp4tecOY0hfEzkypjv/cV/DWguWnAi5/kmbTFefNim8oGg/9mnvk7FD6x0VqpR7qPiw6aK34LEG3lCkzreVABAciucIou0SHbvnJBopuAYt8hkqRtGwWNb8XFQRnQymk8KyXnuGACP7tS0Llnu38ObSB/Zb0/CApI5zRdVnzfeKa6FyWjQ/9SH7WVA+a5Lj/ouOLONKp9EOq7iI0xbEHy2FcoS7pP2U5sqwY5OMmtJPwhSAMXJ8LEdELQ==
Received: from OSZPR01MB6597.jpnprd01.prod.outlook.com (2603:1096:604:f9::10)
 by OSCPR01MB13062.jpnprd01.prod.outlook.com (2603:1096:604:335::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 03:51:03 +0000
Received: from OSZPR01MB6597.jpnprd01.prod.outlook.com
 ([fe80::d0e4:9b77:ede7:4cdb]) by OSZPR01MB6597.jpnprd01.prod.outlook.com
 ([fe80::d0e4:9b77:ede7:4cdb%5]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 03:51:03 +0000
From: wang chaozheng <ultwcz1997@outlook.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
CC: "kvalo@qca.qualcomm.com" <kvalo@qca.qualcomm.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: ath11k for QCA6391
Thread-Topic: ath11k for QCA6391
Thread-Index: AQHbTEb+cY3xDumfk0WK6d+lmreeDQ==
Date: Thu, 12 Dec 2024 03:51:03 +0000
Message-ID: <12ce6ea00fd34e919527021ab17da92cOSZPR01MB6597F2FD7B51B0E5E8BEA5DBD93F2@OSZPR01MB6597.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
arc-seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLH6jA/IZIAOBIge6hD0aNfqVbfYqyexP7RlJhqeVGG+u/7gDHBGCQinmIRRIHSoL8mRmLdisgckKVJsrwYDseex5UqBiO6zVmRp2r346ry+duAW/cMvUCe08RurrM+/IS2534OT62xC9rUFBIVzS2OEs/jeQjdle7NsGtRO5es0urytLnuTXefeQxVAeqMikZK3vjhRVYMNc3uJrC4T3qw2pyavc3QVa1iKsfvmewEK9XypDJEUViayfEgtHqdzs0PT24eiRi4g8ObitnVlbcZKgyQiTiRNTm4kAMm72zeehibpWKPg2waHV6fqrzIAX9EnKvTfqo/14fmexAI4Yg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwQgJ/jNZKyG+oJKzZwzjEWMG/kmQkYQVXjGLFUzMhY=;
 b=A4uY0rOH4cKedn/cdyDoUItavwUIEtNcfXmMM8qkmfmodbPmXLSKyhS6Fjm7TvnKfPkvotYw+WwGmFRL6h4SAgUDdwVqmFdtBA0ZLP3Hj9NnqgawCNu4uFRNkb55RjRFXc9ayVMIVqoH/XXeZ7luVWhyN5VoOPSeQgJ2OJMhNXJjSYjMiEHfps4noWnnuS7zfMyebXsHCusC3BqXQfUqghM7zixEO15H4Mymr8mX7Cq+tVnCpYMm1RyJh2PdGQ7shSoGbF1QMsE/6Gdb3tiPm7GvA2nKQHppnQm2xOzmbWo1H3tT1OWV54TqkMyKuogPwZly0ahv5/wqHzWViZxhGA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwQgJ/jNZKyG+oJKzZwzjEWMG/kmQkYQVXjGLFUzMhY=;
 b=QAflr00fQRAaLMLWXfu3RxlWYbY3FXokELS74FGqTYp06eW2DwNbo4851SVCtHxuNwsPKU/JfEiOj77jqk7EjQSJdxNXO4r++M++b4dHoO/FHBtNuO01vDCn2BgtAftrwhN+hhMQwAN+NZZfXCqegaCBzFJ04IdwuhAw+vOBgFxBtqWICOEcHs3/o4/DB2d05GNkZ1gkpcdINALyYI0j8uDH7D2eBFc7zY1eLLbKl4Kz1gFaqTKDN3agMjqDTIgM2q3vkbWjObiSmvS6C5gqJNeupzBgePRJG7wNzNFJ14+YN3wJHuu1AUJ/lo6D2Y4P3Vu7bx29vr5KUSgJM826zw==
x-ms-office365-filtering-correlation-id: 8648aa3a-3874-4aaa-5842-08dd1a603336
x-ms-traffictypediagnostic: OSZPR01MB6597:EE_|TYCPR01MB11143:EE_|OSZPR01MB6597:EE_|OSCPR01MB13062:EE_
x-microsoft-antispam: BCL:0;ARA:14566002|15080799006|7092599003|19110799003|5062599005|8062599003|15030799003|8060799006|461199028|102099032|10035399004|440099028|3412199025|4302099013|1602099012;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?y/HNSyCjsONCt8PEdAU+9V6H/BsnD8BxHbCf9GRpMJbxnfUQgAH04B0opX?=
 =?iso-8859-1?Q?ixMlnnBforBGmyoiwQuD6g6oUWfv52iLgw3ehclgMxsJTIG+qBy5C13T1N?=
 =?iso-8859-1?Q?4ot0nWX/1p3aPtjs89o/x6w7F5Hs1QWFcNb/1EVx3imG7uVv+Z7CQoxmkA?=
 =?iso-8859-1?Q?4nEwG7gqGCzQBeVjqt9e1icNCLJzBMlNyQksv1kYKjLfwmWHjCDSO7HwvF?=
 =?iso-8859-1?Q?NFFVqm6D01RSNyABbSvjS1fMc8j4IMiEQoYGoK4mv6+4JlPRBhUXyoa+mb?=
 =?iso-8859-1?Q?mclpJDbPrD0MSw8psBhOtJhrdsev8YUYmDzrjvGnR/jdGYRpmxoMrjn6vE?=
 =?iso-8859-1?Q?HL4BiT+09ha1otVB0OwkjGWuD5rJOOzK3L5INb8Cl5l7G6TK/m7G/ymvuT?=
 =?iso-8859-1?Q?8mJhfdHaXF9OlFFrU1u9+t4+yTJq9+UO+Dlv194TNNJG2dSjK+Gwt4E2Je?=
 =?iso-8859-1?Q?hnOb8gvhQ4F2VbgkljVdfn2V4sCJoYeCYNEKzp6mMh48JJQeXUzTvmHT6G?=
 =?iso-8859-1?Q?to//4mW9/pFUqFHk8U0b7qLcw19Ba3K166wxT/fjSgb9KeQ67O7gAQG11w?=
 =?iso-8859-1?Q?ivSU4bYDFJ4+z/USrXJZDJdkVQoEd6G19IPyXL3dc+I2kPs+NtL4lb+spq?=
 =?iso-8859-1?Q?zSnywWsAm1fuGhlPNv/Pif7mitvJwWyB9yo4Ince85k/x/B6OsYBtsF97i?=
 =?iso-8859-1?Q?pHjRBLtNJnnqaJpgYdv5PqIKSoIjnwpfEk2mn7VL91tRTUynCSN6JfnMVo?=
 =?iso-8859-1?Q?0K4PTgExdjLQpNWsaZePgnGXt4L8N7te2HP+ZVgRRNBl8e7WP8GqNJM70N?=
 =?iso-8859-1?Q?g4PITINY82nSzl2zyTd3q9T0xSudvnyB77rDRi6E/2xHf8BCMthrAggENY?=
 =?iso-8859-1?Q?tV1IqSeyFvY5PjGm3/Tx7utAtCLhxt6gnAtYuRLdIY0hZ6dptVQECFaE2H?=
 =?iso-8859-1?Q?5uAYcoM7V0dYIdeWwLtNU7O17gSL50Ax6EKUjvgj+SF8LB5B3aXNX/DIlM?=
 =?iso-8859-1?Q?T3IyjdjLMJua1gPQJfNROzkiOxQypnT7vXdMeMtMv6+RStu4DyS2SOtec4?=
 =?iso-8859-1?Q?iivUeiQuRn5piW58XPhXFJj/PHtPlCCkrlehp30lGiXizVvGn9LbhowcCP?=
 =?iso-8859-1?Q?IGu5BkRPwQb63feRALvQSap9gWb8kBevgb6HLCkxeTWIB84N3RpTY7SWTo?=
 =?iso-8859-1?Q?etclObULQu4Gj38rDjBPOeXM57yWYjL03D2ZN2K/HPpLnPDs+YrJ/YJdYx?=
 =?iso-8859-1?Q?qSd0GNVE+GJVJfvDKXIA=3D=3D?=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: OSZPR01MB6597.jpnprd01.prod.outlook.com
x-ms-exchange-crosstenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
x-ms-exchange-crosstenant-network-message-id: db9427c4-9d72-417c-ac69-08dd1a5fdf09
x-ms-exchange-crosstenant-originalarrivaltime: 12 Dec 2024 03:48:42.2537 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
x-ms-exchange-transport-crosstenantheadersstamped: TYCPR01MB11143
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?j+DJtfzEv4lyyqzzItXsYjnE4mEer7l3t1UPZo3NCLGFOIfG5ivkzrepMQ?=
 =?iso-8859-1?Q?SrlVFNwGfKm0kTTVdEApm+1QLjil0hxY+8RueMxM01YegQpKLZD82wofOm?=
 =?iso-8859-1?Q?f5uU/FyOStTcOd3K0PxX+l4G3R9a9jgqVzs0dEc1kc+UuoLFtpO0une2Lj?=
 =?iso-8859-1?Q?/uL4Hds5PQFf0uCHBS3Inc1Ul6x7hLLyOIR/3XXb618M6i2x0t0y853E0V?=
 =?iso-8859-1?Q?lqMVN3g7c7CfGxfiZOki5mXzG9FH7qN+AJg+VN83uKhvuxHGoGeEsI3oE5?=
 =?iso-8859-1?Q?q7sewu+AfwzJR2NA5BfTa7LoXx+izLuG1v8ajDzsjXurZWBfbthEZSheVP?=
 =?iso-8859-1?Q?L/nDN1wM9QRz0MzlBuch+MZWUpHAJBPz9E3ohuv7OCwnoteMhIlzLTrMcE?=
 =?iso-8859-1?Q?ATn+s0S5jAP+t4iqg83QHYCSPMc6B5a2lyHHuGp+uBe8Lq0vCC0T8I4cf8?=
 =?iso-8859-1?Q?+CKFivrrJ2jUlyWunkVlAdqgYmAhvL6eXjpw8F4bYrqTgKmm4RKYMZ3nff?=
 =?iso-8859-1?Q?U8wTcMOM4ebAPR3MKmz2gsdUKjk+JcEKJBFOLcYscZ7npJx10Blqc7VQ41?=
 =?iso-8859-1?Q?MPeQMYNCEc40veLXbY/htesy1PGLxZ2+vD784Tz+417n4uw5QX+swC+Pzr?=
 =?iso-8859-1?Q?m6N7HTnwWhPAw4dn/d8qJx20ywd36wvGCOzfHQptCwJWEfzA9t9yWGCaoz?=
 =?iso-8859-1?Q?OzzrGTJZdUAT8B33AzQdi9j4CWjfAyjSmmZnrEWiDV6GX0Q3X//yV21K9b?=
 =?iso-8859-1?Q?CJh4vZga6QGG+zgT/JIItB5Rf42SbAZ9e098+g2Bg8R7R23YRp7IHscjAM?=
 =?iso-8859-1?Q?xSCCjdZVUAXKg0lAmfSwtwJwgjU1VNlaFd4roTYKF3L6Ei6FYo9IoAR6Tx?=
 =?iso-8859-1?Q?+FhyNYcVoegQGobmwnIcUkTH1k1L0mH2YqnLz0GAt2pxsDymbTfLpYwMjq?=
 =?iso-8859-1?Q?g9DNnUaglGxTsDbtr8Ae1RdZSV8VUs71VZtIDcAlyfjdel+Y5FF9sHPWNI?=
 =?iso-8859-1?Q?V9TndEQo7bVaTd2iQsaqeeaIbfZ6NS9sTaNcOd1mZH3QcW6Mv3O9Y9DTHz?=
 =?iso-8859-1?Q?7w3VOdKk/VKze9Cl3kkGXb4N+GSj2K71mfow/fDQiXiejLtEhlWqDLXazO?=
 =?iso-8859-1?Q?D6kJGFjZXHxy8HhRRvC2fQUJx0NMrGQTmVmuvmJTZx1dVL+5KEMK0gNNjg?=
 =?iso-8859-1?Q?GijIhnedNZK5P08q8xCJ+pz4hUTxC8qI8LyGj82qFpgtMq2sQqZqXdEl+X?=
 =?iso-8859-1?Q?zS4ZN/Qilmt17500JiP/QE1ycY1bd7qVcfQTq9cRQQEl+gz1rSgv0ypOzf?=
 =?iso-8859-1?Q?bbhV?=
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-office365-filtering-correlation-id-prvs: db9427c4-9d72-417c-ac69-08dd1a5fdf09
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <259CF6FA2334704398919CA6321E15FD@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB6597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8648aa3a-3874-4aaa-5842-08dd1a603336
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 03:51:03.4777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_195114_972643_A14B9421 
X-CRM114-Status: UNSURE (   5.12  )
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

Hello,=0A=
=0A=
I have recently purchased some QCA6391 cards and I am going to try to=0A=
get them working with Linux.=0A=
=0A=
When I installed driver ath11k_pci.ko, it shows following, but not show wir=
eless network cards,=0A=
such as wlan0.=0A=
=0A=
$ dmesg | grep ath11k=0A=
[ =A0 10.376207] ath11k_pci 0004:01:00.0: Adding to iommu group 7=0A=
[ =A0 10.376639] ath11k_pci 0004:01:00.0: WARNING: ath11k PCI support is ex=
perimental!=0A=
[ =A0 10.377478] ath11k_pci 0004:01:00.0: BAR 0: assigned [mem 0x1740000000=
-0x1740ffffff 64bit]=0A=
[ =A0 10.377593] ath11k_pci 0004:01:00.0: enabling device (0000 -> 0002)=0A=
=0A=
Does anyone know?=0A=
=0A=
Thanks=0A=
=0A=
BTW, other information=0A=
$ uname -r=0A=
5.10.104=0A=
=0A=
$ lcpci -mnn=0A=
0004:01:00.0 "Unassigned class [ff00]" "Qualcomm [17cb]" "Device [1101]" "Q=
ualcomm [17cb]" "Device [0108]"=0A=
=0A=
$ find /lib/firmware/ath11k/QCA6390 -type f | xargs md5sum=0A=
fd4aa4a58f33854a751ec7d14d77ce91 =A0/lib/firmware/ath11k/QCA6390/hw2.0/m3.b=
in=0A=
682f7ca2e0b3ea16644c3585772a2cba =A0/lib/firmware/ath11k/QCA6390/hw2.0/amss=
.bin=0A=
39ab8341a089836d244b77be3e98ee1e =A0/lib/firmware/ath11k/QCA6390/hw2.0/boar=
d-2.bin=0A=
fafd08643ce688612c1af3590e309f3e =A0/lib/firmware/ath11k/QCA6390/hw2.0/boar=
d-2.bin_ath11k=0A=
=0A=
--=A0=0A=
ath11k mailing list=0A=
ath11k@lists.infradead.org=0A=
http://lists.infradead.org/mailman/listinfo/ath11k=0A=

