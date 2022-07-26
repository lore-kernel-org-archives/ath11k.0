Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A04BC43334
	for <ath11k@archiver.kernel.org>; Tue, 26 Jul 2022 12:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcdX3XsjPoGjrIp+zUkQ5z/oWU1mZYgs1fzfj/vpIY0=; b=AyJBO26v/Af1WJ
	8X0d5MGmWBt/jFAy2mul+qMeOvrmzXx4yByYiJSHwC7fxIC5+FGeiLSCjf79BW0Kbpm026MfKpDr7
	tSRAhZ0slnF9B/9r0a1hE/vtvpRkR2bQaI4pLWz45h1YvVjb/S8k7YchSJa7BFGLkc/jEYkH6rjPv
	xYnmjSutHPSNLJvRXiNYFElXAcHoXA95xr0tnxzyFrp6VjawHM7kEm3nqca4jZqAd/BL1Mo0W8ptQ
	KN5sXhBkI0e4WX8ebrJ82nzIrgGq5soaz5KVm2b0xVZ5vi3QfG877OP6XghMmrBLG9TgAVr1rba6L
	isi/Au9qAjBkwoFoFmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJpT-00H0g1-SV; Tue, 26 Jul 2022 12:38:27 +0000
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJpR-00H0dG-Og
	for ath11k@lists.infradead.org; Tue, 26 Jul 2022 12:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJErDDD/3i/Ub1GuOe3NwjZro5Zh0DfsecgsumAq7DAFR1xyK90nPsCWvjStyEhArTlGrB+0+GjyD8P7sv/ew0720GCQlgl4O7truldngC7Xk+J5Zgmkp4PxeJIi6HZ3z6ZFKyCO9t4wH+0mxqRoS4ImvDkBg5OJd9DU1xNNYA7LVlCOOvkf1tgXIxugyoMj6rDquVuZgDrHi6bBLT5G1NPVHWZkNNW214bqe4fzOCP2kiv7YzCCNmTjUyH3SRD8F7JnewvXN1mJ6/E6kPva4ZWmY0rZj1rXJ1zGQKWXXcF0MlgMxca48AWE9oyuIb299AsroenPfEHjmBm7F9Yx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbvGIWhybUlLX4D7Gp/fj5Nt7qwbZkPXFePPot9pn18=;
 b=Q3OSz5EJBlf3g8RvYjjfc8BX8ENKIX1J4J5sR8GMGpVQNqjviLwqxUrwQ3z+mUCdcrXAnW1an7BwGc0aNMAb8FJXDxwESJ5VEQWL3RkOcvQ+7vHUDtjmWmZFGwne/iXkPqJhFtVnrfIxwgB3vDtlU2a/J/y/yQ+x9cwwGhGis2FeuEeOvEexQcMZBl+s/njmaYZayVHSs0JQL1bkv+6Q5GgUoan+rpgeSpxTWQrxcmsc+yb96peflETSDz8iEgP/iGLOhaZekyMPYTGrDh6UeUCw+I0zv8h0hK42J2WLkJYqQWlpj+kblMeuPErt9CQnNRubNCKuyhAWMuCfGsTLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbvGIWhybUlLX4D7Gp/fj5Nt7qwbZkPXFePPot9pn18=;
 b=GU0Upgjsu4g8I3Fa7oHvY5X2hdQ4VhvCFcZiCBgWYhZQ53Y+hljt1I0EAqmGgUikrbk32RyTH9v6xQfodDzt3GrYEpdlmWu2JvnDYEPZAZthqSnGCHwLMxbUxW5Dd5Lu8NQlWs2wv+3uW6O5+KWYhK0ypj4MpGuvKj6n+Ec4LSKf5rBze5kRmud44Ne6lmz+TEJbO+4enyR5DKlpewuLb8GpRRSKILg50bbvZWGplVXI0lLDY0WjGf7Tj0GFQF8JdMIuZlcIcwlS+Wl8mgxnZfSCkDloSabrOoISZKUqsht4PtpZmO7L56xf5I2QWLyhEAhWCFkrYAC3Xk4NiU1Wdw==
Received: from AS4P192MB1503.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:4b2::15)
 by DB9P192MB2011.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 12:38:20 +0000
Received: from AS4P192MB1503.EURP192.PROD.OUTLOOK.COM
 ([fe80::ecb5:e680:257a:b333]) by AS4P192MB1503.EURP192.PROD.OUTLOOK.COM
 ([fe80::ecb5:e680:257a:b333%9]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 12:38:20 +0000
From: Antonin GODARD <agodard@witekio.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: RE: ath11k and P2P
Thread-Topic: ath11k and P2P
Thread-Index: AQHYnNxLJrwLp2CF5Emm4W40L0xKVK2Qnr4N
Date: Tue, 26 Jul 2022 12:38:20 +0000
Message-ID:  <AS4P192MB1503AD006D11DA47E0D0EA8AAD949@AS4P192MB1503.EURP192.PROD.OUTLOOK.COM>
References:  <AS4P192MB150315B3727210918C6A6A7EAD919@AS4P192MB1503.EURP192.PROD.OUTLOOK.COM>
In-Reply-To:  <AS4P192MB150315B3727210918C6A6A7EAD919@AS4P192MB1503.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36501d39-8ae6-4e9e-82e4-08da6f03b8fb
x-ms-traffictypediagnostic: DB9P192MB2011:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3sJiQCY/NqsBKo78hM9vt5yZRB9bmyVVDNGJLDzU1e2fqUf33fad+ONvaAYNL8Ch27FgTyyUQAvxIiFsUfoOkbxqJ8EqZiWmR4b3A7tMb+IUz8G3zxRKJo/gJ8efA4ZT293PAOEUSIu3KMgIq5FHjs+Zt2FDwK2WFB/AcZ6mPu4tpsYo4S7i0xRbHwS6DU6EIIKwyzxsZRcSqyGIdkrbTEf85WQ4aWuUy2U3HvMBP2c6Ty65WK1Cz2VchXhdzCfR8P1hK2tLmyQTXtUu5FSMd4EqORAF5+fxuEaFqFnWelIkUuRqf1mdzGdQ+2WOQZKS+sWALkUt/0kO0B8UNvwBIp0WBkaA3XMFLUOaISTVenKmhNLtaI4g83ItS+ub5rtZ2nDF1whG1TyHDzZL0d+rJLwmbqGX4+fhERX1ttl7vvSRB4cAG35OMCPtSygJpg5BhPWxI6DD/1WfRthRB/CpurTU+sVYqWsCV6n0a+rZmq9/Jk004TouNgGE0Wga6ibeP7CVF7WHN+we55Wgaw3Z7VNO2cXtX/70VBYCouKqzDZ7gJ0g1gw9zTEu0Zw0ddGaLLRqVeDG9CrYlik7fCyze2O5xvQyVnWjQzNtpfI4D5iP8pCdEAI7m21jcEAravudBcKMlYOUaAcHhkNe1tiUAy14U4+yivb/j71T9FchxekpPoJIvEJPw7LQBWQM5cXCnbRiHUykcWessjR0X7XOWI8YUxaH6GCoBD5bqSSp71Gbj4OYy+oJoCchm2hi2vBdWPcvItUk/JEFvHD1z3GNfpx0mddURs+3NNsPXP1W5Fd8OoXe8zcJrY0yFSAxVLRQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P192MB1503.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(376002)(39850400004)(346002)(136003)(396003)(366004)(186003)(83380400001)(6916009)(91956017)(6506007)(7696005)(9686003)(41300700001)(2906002)(26005)(4744005)(86362001)(122000001)(38070700005)(33656002)(55016003)(71200400001)(7116003)(5660300002)(316002)(478600001)(52536014)(8676002)(64756008)(38100700002)(76116006)(66946007)(66556008)(66476007)(66446008)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?2pZJnyBeIKRnvQdzgMMy80p750mcraXmrQ2QISrSnyn7ypPd+WpfP+QAMN?=
 =?iso-8859-1?Q?mv9oLYMebYnl46vuSv9NrLd27/q8VR/5jV6cebPbzcdfHA6kD3qHCAEAuH?=
 =?iso-8859-1?Q?hFRyEReozLyoibPchVSZz6+oks0Hm9GJU8jxPiGcZe57115aHGOdWAF3oy?=
 =?iso-8859-1?Q?KtHfjtAFANkPAiwjzyJt+MnahYcSw3BqPu5fOd9PZj9judR8PapIMRYMFc?=
 =?iso-8859-1?Q?qn4UmGp1Gzb5a0xpJkqWOSYoF6LVIkU6lhWjpcdi3xuP8S8XC+m0BDg8Lx?=
 =?iso-8859-1?Q?k9DbEZTLaJPq1D6+D5dURzmzfgTVEn5zGXA9Kfgm1FwZCJNCZyy45Jug8m?=
 =?iso-8859-1?Q?WLjfjcHXIGB6XrcSPsil7VdLDUQzhqX2fOnJqLqhyAx1Yrys9R+N8ShuIy?=
 =?iso-8859-1?Q?kxBOUcX3A14hPlhv4kwZXqs73kOryUM2i2030flPb578CIQatdIv56xkX8?=
 =?iso-8859-1?Q?PsPnta7w6qCXTKU2tI+hzquoi9vFhAGSgszorxdeMQik5tcBgZ4YOYP0rv?=
 =?iso-8859-1?Q?ICUCFZUq46FcAOGNutH2gUQ7BxNhjgoh1+1gpLLSy5XLZb1/jAXJkEl+vg?=
 =?iso-8859-1?Q?6aoavUEUIC1GKji9mSkoOqvsczywCE/g/koqmRx9axCHFj4s10TRyhagas?=
 =?iso-8859-1?Q?enMVGyWxjeZEhhOJnuXMtOvlCBK4umUViErOOeUR1JZLuucycIWpRt787h?=
 =?iso-8859-1?Q?AN61rVJGGAVGqtoi1qW2ufxC6rQ/TPchM51b2qkpKfQD3/brR097JxUXQ1?=
 =?iso-8859-1?Q?1uPeCaSJJotZBodUuVedfyo5LIYjvcJTjGQqcBMCAL2c6FsNf93anJ4ETX?=
 =?iso-8859-1?Q?YtbSMJe4EsxXt7VWnZQAwTLNs1aDJaxV5Eu0WNJAfvnj6GjvIpV1fnk8sX?=
 =?iso-8859-1?Q?pFT3exPLQ0RLFWD+//P+tO3N7bQw9uwfL9ibAqeL2gSLZiVM8zsR03k0/A?=
 =?iso-8859-1?Q?eMwrZ/eXM2QrF8TvkwtnwGkmbMSBDKNYYxXA939bLmgNS/xQHIVQNBMvBz?=
 =?iso-8859-1?Q?24Snj6fOcA16dgNUHjTvzTDbevoMs9wILN0t5oKHprTCcswwKcMMqRzYr3?=
 =?iso-8859-1?Q?49njC36kIHYeK916StOllDWWH0X0qQ4dGfeYKtbHDPOiGVRpjwXZT6LQ9B?=
 =?iso-8859-1?Q?8mM8magjDojXvaHllv+/EFC1MczGNxaf2T/ytJBI58tdlH1DB/Zs6U9q5j?=
 =?iso-8859-1?Q?Qn8wBpN2awQUFaSklK20FiYoEiiN1uZtQQ7C8KXK6EFoK9c1ZUMWhpnNTm?=
 =?iso-8859-1?Q?rBesL2bWi9HKKqFNxvxrs4ADcXFdCgBkfCBKMArh/2i91cKf3JVe2226LZ?=
 =?iso-8859-1?Q?OEs3VEBj6fjVHMlpjh8mduTTS2rUSmgl8s+iF7dSUCXYGNiXzRymzR6yGp?=
 =?iso-8859-1?Q?erwiIv23wpV+G6ufKxipZnigVPfFnr5NbE9oBb6MPxO2zI9l5mty9r6and?=
 =?iso-8859-1?Q?Uqr2gFqwEdmor9qf38rqETS4go3/iPv+X4Et0oK4RqvSolYB7QlTgaqUeO?=
 =?iso-8859-1?Q?1oNj04YudhWs5xS1sYf78IhryMGCjUDK4jCoz7ooj+Voq10QagOvTCTUjh?=
 =?iso-8859-1?Q?QiRYideoodPvM4iS8mdHALZEt7qYnNieO4wzyJZovJSkaawXF5njknxzOA?=
 =?iso-8859-1?Q?G8gjemVtLE4ys6E0VdddrYCu3QlZoTRWgQ?=
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P192MB1503.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36501d39-8ae6-4e9e-82e4-08da6f03b8fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 12:38:20.4953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltjsxQBhqaJD22kui2xiC0zcOfEII1fXmaEUsvMOf02yAPFmeEDcTaasSdfIR+49Wn6E4krj9/94oiLCcFG+EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB2011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_053825_830928_71E6C907 
X-CRM114-Status: UNSURE (   6.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

Have you got any updates on this?

Thank you,
Regards,
Antonin


De : Antonin GODARD
Envoy=E9 : jeudi 21 juillet 2022 10:35
=C0 : ath11k@lists.infradead.org <ath11k@lists.infradead.org>
Objet : ath11k and P2P

Hi,

As of today it is known that P2P-Client and P2P-GO are unsupported features=
 of the ath11k driver.
Are we able to tell whether this feature will be implemented in the future?=
 If yes, do we have any information on its development progress and its rel=
ease date?

Thanks,
Regards,
Antonin

This message contains confidential information and is intended only for the=
 individual(s) addressed in the message. If you aren't the named addressee,=
 you should not disseminate, distribute, or copy this e-mail.

We continuously commit to comply with the applicable data protection laws a=
nd ensure fair and transparent processing of your personal data. Please rea=
d our privacy statement including an information notice and data protection=
 policy for detailed information on our website.

-- =

ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
