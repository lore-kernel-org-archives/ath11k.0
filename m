Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6345BFA3722
	for <ath11k@archiver.kernel.org>; Fri, 13 Sep 2024 06:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn8Z+ULGAdI4K5hJmPc4lKLTZVvWasL3jYbkfVdfp7U=; b=f0QgeO1Eo4M9dkkWyWIR57oR+e
	LcQ69g/r80jppddkYCsdIQ+RLpLyarDpE99BgleUsJdgwnLLED0U0YhGTCs7AXeoKtZO2x9LxAOVg
	sYg7/Jf6tIJXnckj3AiJKXyNaxWjFLcn6ODi2fTh6cEgfYPZX9ix93k/fUh0cV7NzwzKNPYQX+JMg
	00oLGkfBpkE5RrM3qpAZ2Zxy2WIkUSHrks99xEPmLn4vGnZIdd3+OWjZwom25QySVKiOQkc+hubwd
	q4zHXAYSPQkwOC2laprpHIn1AKGoMxrMDl3b51fVS0pgQCLrO9Smx16WLRGijxYPe7+TIYkpZYUUA
	/BeZMVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp0H1-0000000F6Xo-1YQY;
	Fri, 13 Sep 2024 06:59:19 +0000
Received: from mail-germanywestcentralazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c20c::4] helo=FR4P281CU032.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp0Gy-0000000F6X9-1HMC
	for ath11k@lists.infradead.org;
	Fri, 13 Sep 2024 06:59:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLJbrXEWyyC5sAi/jSL5xbnbIIKZcyS+3JoJ0FRfZ2eCklDcjkILGNxwYPDgWpBsgHronPXjQF1I2fGJGx3+sp3gbGicy26hLrzHWS+sk3JWuKrIF2IvnSHof2UuwsL1s0Auux5/4dD4dW8kPEnSNE8KWPjXEREujoVy4AYlIhENwcKjp3fl0MIczxrZyy7dydt8VQZtqxcJ7M6GT1W1CgHtHnWXXtLAaReXkQbaaMg1rIzQ1yQ3qf0TFfcCOD5F5qK+Sw8XFtYu4HAjhrXPW50ejHAyTNfH83vEn3mJr8D1G6cFhLWiFAqPiB3b4V8CT8li7lPNGdb3m9239lytBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn8Z+ULGAdI4K5hJmPc4lKLTZVvWasL3jYbkfVdfp7U=;
 b=aja2FFEzDGdC9IECTfAaM1FyWncveNqLqDEJf4yBrdG8sR0fMJqVQ8sPckTIEfEPFQSp3DoWLAdPBXLa8eCrK4x2Wl15hN7g7BRTKGIrE9LFlaD4MJOV6XGANBpUzpsdwL1KB9Jrdjzw1q5G9jFtvtl8T7HmEkAHUICb9OZFwsz1ID5GwHThLd9jh0tp9IxJ0EZhqsA8CXhLp1TJ1jSZ91EgqfWyvoe071hU/7XSg2Vkd2iJ4xcrCT9xHYABN8hV9ykfOUQanjARZuteX4q+uaHNa6wOLCAm/x9TWxs3I1TGG+kAnQ89+1Rj3hLgsbpxrSqdKyoorwd5u43oGsZNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ghmt.de; dmarc=pass action=none header.from=ghmt.de; dkim=pass
 header.d=ghmt.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghmt.onmicrosoft.com;
 s=selector1-ghmt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn8Z+ULGAdI4K5hJmPc4lKLTZVvWasL3jYbkfVdfp7U=;
 b=Qt89SJKt9vw/kCv+jFHaa0zGV1GxppXkUrhspRDQqU2XuRCesCJcqInZXgVTVPl6O1iQfgqMCvFK4oe6MDmQ34CAqkO7CeuxePJpKyk3Q+AhwwR/fXmE3jalcx6gzhxc0byGgkwXWk9va8tNElItztKjr38ovGX/C6/hMuRbC0pUW5h3JTg2Boj/9RgyN1U0U/Cw5sYfgZ6CqLd4D6nkNhCSRjHMi+mdddSYm+A4zp1TmjJnP8lfUPU+w5TJ6MGN3JA0gvAxnZuqbHg4vv34FBsz5PtjrbLF3+xS7LYZjtQBmVdksgBitMpETG5HzZYx/cvlHD2dbQMOMSirF+IOEA==
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:2::16) by
 FR5P281MB3960.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.18; Fri, 13 Sep 2024 06:59:03 +0000
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3c83:68ab:ebff:3f6d]) by FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3c83:68ab:ebff:3f6d%6]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 06:59:03 +0000
From: "Lindner, Frank" <Frank.Lindner@ghmt.de>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: RE:: ath11k monitor mode
Thread-Topic: : ath11k monitor mode
Thread-Index: AQHbBaprWkr4fwaEu0KhAU7P9S1xgA==
Date: Fri, 13 Sep 2024 06:59:03 +0000
Message-ID: <FRYP281MB016057FD5857443FBBB1DD28EB652@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
References: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <43b0cdc0-f489-410a-a702-5a5092b9bc18@quicinc.com>
 <8ab6d337-1c2b-40d8-80a4-2a1ca4092987@quicinc.com>
 <d93be101-4aa4-414c-bb1f-292d3f8fe27c@quicinc.com>
 <FRYP281MB0160C7239CB63E4061D4CDB4EB1A2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <FRYP281MB0160FB54135444832AA77E6AEBC22@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <841700e2-fb8b-4700-b794-17ea9abcb011@quicinc.com>
 <669135a4.170a0220.8fbf0.26d5@mx.google.com>
In-Reply-To: <669135a4.170a0220.8fbf0.26d5@mx.google.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ghmt.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRYP281MB0160:EE_|FR5P281MB3960:EE_
x-ms-office365-filtering-correlation-id: 0670293d-7ad1-42b0-7f91-08dcd3c18da0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?sR9/za6korIdOjniSFyy2ums9NMUnGnXIzNGX+lSvjlnw304jvdaqvdnVf?=
 =?iso-8859-1?Q?AdHr/xzFLOKfXwUuajcjAw7sgSHJeoSaqGH/7mOh771j0WxIGcZqrPxkjx?=
 =?iso-8859-1?Q?vqnQtNGxsiQAvwCYf9ywfjchDj6M6N9SSqTKJlbGUdbZUi11ArP+C/wIO4?=
 =?iso-8859-1?Q?fc0jo9whOaTLr6qAHBJfcsMlKmLSNVyBmeyrnwHsylsuhpqnY8ilp7Wrk+?=
 =?iso-8859-1?Q?b3d/bEM4ClG3IIDP6wC0C9haQJHlLZAA6ZetKckVUDuwXVT1X1XWvcNG2+?=
 =?iso-8859-1?Q?GPKwm9qSqmb0QjQMKlr0Jsa3al6bac1SDE8ZaUUHLlt2pbRhYW15TC7EJS?=
 =?iso-8859-1?Q?umxml9atQrkKfS/FplI/vYRAlVgSup4LsGpt8wWW/hUF3ygq06Tzef+GrK?=
 =?iso-8859-1?Q?ztLHhb5UNumdyPsc8EME5ig9nnTwEZEFO455Qp9Uj8UMgyY8yEHPAnAHWM?=
 =?iso-8859-1?Q?JbeO2+Lxccmgusshrs/y2iuzes/xAGDkyfx7A6bo7Gn0B64GKmiYAucW0Q?=
 =?iso-8859-1?Q?qBT7GNdvl55s2ezarPCiS6kj4Igf1V2h93qedVCy1qAbpm31rLfuelJe3R?=
 =?iso-8859-1?Q?LvIiqfHTHlOdWijEX4a8DgxToHJ3M2VR12x5nNNoxkPIrY1ekk1B02k7bP?=
 =?iso-8859-1?Q?sEgSSIOWW5JdcCfM2d4ws3dzzwOaTh6YE91frUwKnRixwGkMG9/bUn6EcB?=
 =?iso-8859-1?Q?pQBYSiYzYcld4DA3IZF7mx5V1y86I0kuuTzzH4GJkUW2vJgsHJlguqiogU?=
 =?iso-8859-1?Q?iMdsbcwexmrXId0XQ44R67pGYhJJrMzq1y31oiWG5Y1jdabidIN7yLy3+V?=
 =?iso-8859-1?Q?qguCbdacMqegf17sZRwITR+/hNuAJSDr7J+338stdwwgLvC/TCis+6kryU?=
 =?iso-8859-1?Q?9Z6Q91nuyvYX0zFSCp6jAPiDeryb98x0EmpaHgpF3c8JmC5IM2RbDTK4+Z?=
 =?iso-8859-1?Q?lQoIxbphV5qW4qKyQbs4Ad0KiupaxIV9cG963dwpHyQWqE+roj2sseXTV9?=
 =?iso-8859-1?Q?5olPJcERqgLjTDoJ3E1FJmjL5Ofo13jmH3VZmUUNDrNTEFKIGftsRzlGOZ?=
 =?iso-8859-1?Q?sIgRb2jpIo0BJU9FqP8CqPv3kX42TNV692ORSQbUm+t07SOpPLzYs2xMED?=
 =?iso-8859-1?Q?sMbKpi/SsRy+XOYYFZOIRkMmNI1ZkvsLlkhAMCBnAEhG0FmbhLZI7pYE35?=
 =?iso-8859-1?Q?xsi7cFTgaRj8IWWcOxPBsoXyNaP083O7QP5Ex2HsecciFTrNqOS5rOAUw+?=
 =?iso-8859-1?Q?z+dwXLhA720fpKkS9Se2x5amqty/79OefYP0pW5umj8m7F1S2cQO0EvQlX?=
 =?iso-8859-1?Q?+VeZjh1JFzOTiwvNNgKMnB31eFvVsxb2lAzHg5dwCPlEqB3dIKf6oEeFjD?=
 =?iso-8859-1?Q?uho8FqRrusuphgIaseBh3I9Yq+JzoNuzFNgAq60YuIRlFMJHyU5//gH4wf?=
 =?iso-8859-1?Q?JTTTeuBTFzKV8cuo0Qss/SMBhPdvpy6ham5kVw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DMtGU+1FWJZWLzAsEa4UdnGq5clkZL7u4pXjseQiWlPK4mezk9Qvgi2Vh8?=
 =?iso-8859-1?Q?N3qPjBufvJ1UXxuWAgyDFHug0hFvToIvBHKykmDWC3prOa7DfOozTOikMh?=
 =?iso-8859-1?Q?I0SGVT5v4EJm7tmwEucxhn8Kwaf5ahcVoVka7ZVSTiP8Js0t6opVDDE2Ti?=
 =?iso-8859-1?Q?k2nzHfl6B4qUg43yf2J0wZZt98LBOOSsQdq+fdqxbe+xOkzQEiZ0xBn/gS?=
 =?iso-8859-1?Q?vsq0H24p7F2fL2gUdB2qR+q33Y0QmYvOSUEe4STJwnRIBMODJ5IN5rUpLZ?=
 =?iso-8859-1?Q?Xm47pLIWNS+heR6gku1zg/p464aZNvIKQazX/5Pj4LtkWVg5w7T8ZZ6B22?=
 =?iso-8859-1?Q?7Hf7jUDPGPC3SlIWhUuJxNDwDJdKVgTHvAL/FI41pVi/gmVosv+Mxqjuby?=
 =?iso-8859-1?Q?MkkH7KQbDdxV0wQEN/6A06AEy8/plQnx7WQyM6N9CDsxT0GMSPD7QDr1wH?=
 =?iso-8859-1?Q?rCbfS5IVmECsrfEZTbhKymKNVDtL9TlYg67iq3Qd/k2E+P+PqQYOq7pRJU?=
 =?iso-8859-1?Q?8Ow3UjZinR4OPTKin+rC2HV1jkbJZ33eLJ+Y6pyavqQLEIq0bAlHxdJ1Ue?=
 =?iso-8859-1?Q?vWDMpeM11ryW18Ce3FWFeW5WHNLTSwA/EGxkTTluYqqy/x7k2V5Z4vS0HL?=
 =?iso-8859-1?Q?XfqSf5vWxf3si46jYWLz7nFybxvXgHFDan1eTmhp++mzHkqKqN01L3Jv0N?=
 =?iso-8859-1?Q?5b1vXI5Scrh8Z6FopVaFWr6vpWFiWwG5yvku+aBGFOAsmH9amqu+L5EaKQ?=
 =?iso-8859-1?Q?P3gX6QZ4IYsM93A0XC39bO73OBIGzDzQKb505IY1IrDKy/YnizUVBAkF5J?=
 =?iso-8859-1?Q?qW0u0MGyweIZydCbhASBsvmzw6QP1q/nzfqTIOSVkblJoKE+Wojc5MXe54?=
 =?iso-8859-1?Q?4d734rlKOAYlllu5rbqMpYmbE0lm3DnUlKp7xGIv907IibuK4qDaYSonxx?=
 =?iso-8859-1?Q?l6rfPH91HkibeaJCuuu94K+MyDtbaOhz4ZScoJLdoLUGWFIWpuhVMmz0+H?=
 =?iso-8859-1?Q?5PRyXGvMw0InM9KVhtovIc3q7XfVohP5BzVFZ8s12R+mr4jYUOaCkJn6FD?=
 =?iso-8859-1?Q?fsa96FmNowDgrVP6DpKm4PsHcY4HBodQXTR6Iwh98mAhrmdu1tugWCewTn?=
 =?iso-8859-1?Q?q3R0CxY6rhdA1Sm/OLxxyH+CKYtJtDNdBgx43ySmvtR1sa8wdFBm8lJfPt?=
 =?iso-8859-1?Q?XUeBbdupwxVFNRal1uvPJ7HDHqI8cMjxLlE7IrpOugCkSWN6iyr9DsVp2S?=
 =?iso-8859-1?Q?iQRY0tBXLCu+zMISQdR+sv/DKMX+j//O1KmjvzPbi/L19ZDZfKw9i5gAr5?=
 =?iso-8859-1?Q?DUUAzfhSmbphA0TTVQ7VEe4Ygy+Qvfd+qS8XYx/wtJQ+oFHk6xrx+fU5Ft?=
 =?iso-8859-1?Q?GItFa7vF5jQM/Qr5tQmPDJ7HbcTRQAgLRejj5FbFC0rtFXt2/8uuQQIIPE?=
 =?iso-8859-1?Q?XO7fRQWOZPRdrtV4FSNBzyWrp1vA1LRd/EY80E34900L/HiPQmD62PW1iT?=
 =?iso-8859-1?Q?tISXflvaOfFzpOLFRBmb7emToKEX5Utl7kEU2CUQkrEtXJ6npoPbaGLoMV?=
 =?iso-8859-1?Q?FSa2u5Kui1Aii5gKwG7OTYS7qG488x0T0MhQmgtumx9+AXA+xkwYJ9z7Dg?=
 =?iso-8859-1?Q?VD0O3EMO9CWyPdgYxi+d7PjjA0wP3bxegRWyoeLBZXJBjXw10Ny5R+FzY3?=
 =?iso-8859-1?Q?DOizX6ZoB4GkQQn+I7nQsDln+MNhomuOJ+dQRn5/?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ghmt.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0670293d-7ad1-42b0-7f91-08dcd3c18da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 06:59:03.7896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9223b922-6d43-40bb-85e5-a10749de3853
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4fDMjsfSEZiF0j7KfoHsWuUdFN1Ndb98ROwc4VY5SSYDQOst3xB2gZDtH+b7L+GUKjmVAPTH4e8D6ZtoxtYgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB3960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_235916_382009_1FA85055 
X-CRM114-Status: UNSURE (   9.77  )
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

Hi everyone,

is there any update on the topic ath11k monitor mode?
We prefer to use QCA chipsets, but currently its not possible.

TIA, BR
Frank

-----Urspr=FCngliche Nachricht-----
Von: ath11k <ath11k-bounces@lists.infradead.org> Im Auftrag von Giedrius
Gesendet: Freitag, 12. Juli 2024 15:55
An: ath11k@lists.infradead.org
Betreff: Re: AW: ath11k monitor mode

On Mon, Jun 17, 2024 at 10:18:14AM +0800, Kang Yang wrote:
> Hi, there is another issue on this monitor mode, so we spent some time
> on it. At present, it seems that two patches are needed to fully fix it.
>
> I will send them to review group after verification by the testing team.

Are these patches available anywhere?

I would be interested in testing them out, even if unverified.
Currently, any significant WiFi traffic is causing RCU stall on monitor int=
erface.

Thank you,
Giedrius



Vorstand: Dirk Wilhelm (V), Wulf Jannsen
Aufsichtsrat: Ron Scheepers (V)
Handelsregister: HRB Saarbr=FCcken Nr. 13201
Ust.ID Nr.: DE 153807627

