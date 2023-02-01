Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31078C63797
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJPC6HnlDmeAIpDPooTzMu8NH6zq4t08050ZaOYW/NI=; b=SfSrH+VOjFSNhM
	A7SpdjVhu0yodQZl9OmbGI4V+qoESzUxLMYpD7Tidkzya88Vu4etIdhPl4yPcFautas9IqjdgpIDD
	MBQUbzE6d9fRHn8OrQXdiCkhegafCbRG1jJCBLb8eSEHiQ07DMa/GZCJ+KbNTqgsZjMJ7UcOBY9f5
	y3+4lM3ltlZdTeEvd7m0G5jV3xxH9n5GPNk8ass4Aa2ufjp7+4kij7PG0C5pV1D/9j0DDkf9YzIsq
	rSNuqVf960Rod0TKrlsvzY9CxdP6ex7WApxVeMeMwKRs2EVyKuPQeb5KxKMGXTJeHL/uK2zJ9RmeT
	QTeH4hNZ4jVmCCm7GfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJyG-00DbHQ-9V; Wed, 01 Feb 2023 20:44:44 +0000
Received: from mail-psaapc01on2072b.outbound.protection.outlook.com ([2a01:111:f400:feae::72b] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJyD-00DbFk-Sg
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 20:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Doi5xi2s9V8JixsIAufuKV8O0EgoZXrS2aIi8Hdcalm2N//1NEXIzPO7SyBTzDjeKnOueFiQ+c8wtNpYvpRvGQjkoKU2akDGFHY/jSicjiPKMiHOWpSQVgiasP+SY4/M4V13u+z9+Fwhdm5qiciHlkE7OgqAiSYsk96IZk4P3e35PSaysgDQUROMRdUHFe8br1qC4T8ZaojX+UtDv4Qmm06fWsrdf4qlV2yygqPcKxCPa+s2lwZt/DvHy5YN2Ly0Q0UauZ8ZIHFI8zGD0q5cxBXvysAjStaRZq9aMbAsw7ymhoJeH7nBfr2E/JIkspMrL7VUHNrnT3iVIgGv0NMkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxmJ0JoBTmnR7tKk6Z5RcPOCFxwnAp4vkwjOR6uF9sk=;
 b=DI32UXenrrgrqAFFbVoMlNzfF3oA4n4iMwZnTDw3Sm8S4VTkWYnPXHc3LajDl1YwOU0NNhYc2gTxMcIKGfxMeYY7X918eoF+dOwMoEPlwxax4MSrvM3TT8EA5YXkaJyfL3Mp1J/TXYHQAsxSKmNLSIR7V42oSzqhgLANSzXrXZ8XPpBGFXO7/poUFi62nAWWcRtqhQLcDi3SOFKgDDvGmX1Y1yypSMboov/3tImGdrKvc3pN4V/BllY9G4HW4A3XKNsF2+48cfiqPeTr/0LjSlcN0L3oaAYylQMFBT6sS2kZC6xBCoW0mGf7CgjBxtKEVqaS/G7cLfE549lHEMeC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxmJ0JoBTmnR7tKk6Z5RcPOCFxwnAp4vkwjOR6uF9sk=;
 b=kYdlIGtCLkos1ESajvpRX99/HUR/btvOStsgmdSfi8WF97vkQEHnRGX9wbHcqgWt5EQ2h7tew41+glGfh99wmulzApuiX6080QvPDhyEziUk4kVSDaGCIye8Y+e6+y7TThu6paiHmd0Cly8Wa7X0ncMU61W+T3nVwsvvJ4QIK+c=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by TYWPR01MB9906.jpnprd01.prod.outlook.com (2603:1096:400:236::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Wed, 1 Feb
 2023 20:44:35 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a249:60f:e09a:70bc]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a249:60f:e09a:70bc%9]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 20:44:35 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Douglas Anderson <dianders@chromium.org>, "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>, "junyuu@chromium.org"
	<junyuu@chromium.org>, Youghandhar Chintala <quic_youghand@quicinc.com>, Jiri
 Slaby <jirislaby@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Nick
 Kossifidis <mickflemm@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Marc Zyngier <maz@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] wifi: ath5k: Use platform_get_irq() to get the
 interrupt
Thread-Topic: [PATCH v2 2/2] wifi: ath5k: Use platform_get_irq() to get the
 interrupt
Thread-Index: AQHZNl3rzcyQcazGiUq1wUEKfZMPgq66jmCw
Date: Wed, 1 Feb 2023 20:44:35 +0000
Message-ID:  <OSZPR01MB7019B1D2D0367354BF03F5D3AAD19@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References:  <20230201084131.v2.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
 <20230201084131.v2.2.Ic4f8542b0588d7eb4bc6e322d4af3d2064e84ff0@changeid>
In-Reply-To:  <20230201084131.v2.2.Ic4f8542b0588d7eb4bc6e322d4af3d2064e84ff0@changeid>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|TYWPR01MB9906:EE_
x-ms-office365-filtering-correlation-id: 3d93f5ff-7c63-49a9-96b2-08db04952119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bNFgkzpeHvf4kJMiRMLp9ljyatI+Z0lINEb96ULDxcqrsCTTln2NtxPrIDIshacXroiEuV6ju13qxs2b/SsbD73+ReI4RNNS3XlKO8ejTiTBHk8AkijaW+62oGnxiZv4qyGmrFzVK0ONg1wAo8wU3yb5r7GnSMLuGTNZewkQ+TprfIABxU3tXJm3mLQbQQcEGhzXnF4qZligsIa+dlsl3pzJft4C6gcWbhaGIahPeYw01vwgeyQMBjz42f/l/hM8KGbIOWidAZPWN+HqRsDwzGNAm2Cbwje073gdyJ3oXCX6N4UXhqiECqFe05wswAS99LQq5PwL/PE4MNKM8qk2r5hNM6S8ojKmXe52nqm2Iogm0TE2ZW649PpM4cE8kympLRE8A4JWQ/+rZg3O9+jt8fUfYvJK2yN8x+jQ+6WWXN+bPi8gJRCyiiAChC+MYbCd+vAB8Pl5b8OSxFpr19fnOhAvTaxynIdHQ18HqElxiLx8FkAVjlzn2JD6kvb1cn/I8h+NJHIyNLfSZkYOKuDQEKRyEUUM9KEPXQQJZtCkQlpDu/HSMcQ2BlcF/iJxe1Fq5xKHLrXDrq2IcucLlDIrcIPVg5zopt7NJnD1BsTVkkbZq8rZyBPHjZwt9rwxlhJhik8cgw/wKz1DikARxOZIn0o+9gMkdyNEC6lCtAZn12SNveb7t2SGUEcQIxccegZG2WfVCTgLJwIDOHwgTjYZfRD3JZr95VD7auzI4dpG36BB2hf37hi6Mh5lZpqV4pR/
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199018)(4326008)(66556008)(110136005)(5660300002)(316002)(54906003)(52536014)(66446008)(64756008)(7416002)(2906002)(41300700001)(8676002)(76116006)(8936002)(66476007)(66946007)(71200400001)(7696005)(478600001)(186003)(6506007)(9686003)(26005)(83380400001)(33656002)(55016003)(38100700002)(86362001)(122000001)(38070700005)(32563001)(15583001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?9J2DTYCC8Du7zQ0cti5J3+CRgMW4mVy4pQWbA5v19mIYSYTz9XxwdtlEzaXh?=
 =?us-ascii?Q?qbTiYCP3vzeKzPD+V55XK2ra5qWQYc7eCyzBEMwVWEMbCMrYhIC8Kf1Yiry5?=
 =?us-ascii?Q?KZegXuwX3+cl4DgVgPjkgqWejfOvk/S4rBJE2i6nxg+hkzu6VjeYBDJ0b/Uk?=
 =?us-ascii?Q?wcUlju9we3/msSBCk2VNlVI58Gec9tTgtJhkyVGiz6Uj45fL511dNm9iO3BM?=
 =?us-ascii?Q?uSD6ntDcPUKNJM81OuWIxkwuI70DjsBmwkcGtL2//WZGuvc+j0A/3rgGYDuT?=
 =?us-ascii?Q?eQjOA6Lgn/FYd2NeRyGclpibDrPEpFkGyoMjFfO1CYNkUaU2raEwl+k+Slnc?=
 =?us-ascii?Q?/6YxT1TPzZwJrKfczOFN7gDRH9xFn7py+5gmsIKpvavgkKduv/XhnqA5uVTQ?=
 =?us-ascii?Q?wxMEtkzuCIKoBYFkPfDHMNLQcRpTDGAE2atLtyA09b0OJs6SdKYrOPc/OF7b?=
 =?us-ascii?Q?sqxML0dmjj5cBk88Y0UP+H3SrwrkVcxDDO9gOq3xaITtVxVUIs8rWKOAvbFe?=
 =?us-ascii?Q?7fLF3eWBM9h34bvZ6JOYbtz10C8WnXX+L6eiMV61MATs8y/e5g3Yg8wXTBLF?=
 =?us-ascii?Q?Kb6pb6UZhTnlisHV22TzuHhpvGbTn7NzcFetFBsWHzqZjOP3EwJX25vCilcu?=
 =?us-ascii?Q?dBXAaeOBnbAzKH5B9IuyYnyPmOAr5mKWYhucOHP8oDCJ4fX51gjYhFDqnhAr?=
 =?us-ascii?Q?vb1Q74JjS7WJxjSux12LA743wmP407BeSYklDGkGLG93Tps+uWhUl1Aww3wC?=
 =?us-ascii?Q?L6wDKFKZcydxIQ6EvEBksHd3GGrKpF8Sn8QEPDnw2ZavkOQPqRPLtK/xBs+d?=
 =?us-ascii?Q?UiXWGxiyg98eQzN+YkTNyqHImzg1+K+rqcTq/J5cXZ8OnuF3OlzYf7sEvi2F?=
 =?us-ascii?Q?0ug334BmM3V/3gqjyA9nAWtri9ExifiVY4bnbcz+Er9XVhZx9iEPVwvhxBgk?=
 =?us-ascii?Q?UZZllhH0UmvaSVWs+SVW8Em8ngAZC8cJwKDoKFZl2RWQ5K0sJtckW3reswm9?=
 =?us-ascii?Q?6VHBbKT1sY3rr5I7VYpdLBBBncpBKrZKFSgJjOAarClmku8hA1H/umgMhw43?=
 =?us-ascii?Q?eOPQWRa8/uYE9ab1+bugCtqZhFWep1cTTqFiofnJwNt8zjiah4+7Q1qQuMFn?=
 =?us-ascii?Q?2JrEeQvHofpVmzrbJGtN+yn/SbrqXJ92FlGXLMNi7W7PuAFTqu84er0fjeNU?=
 =?us-ascii?Q?6FzbBmLfDMrS6xbEj8iq0ROZ7Gva22atoJnUEfSoAGmzGBtfN6e0mjM7+4ND?=
 =?us-ascii?Q?24wmP3dpRLgGrmxnhL59y6giAaxuQ3Zm5H14h/pKJZuQ97kVzn4YlkOXQJrf?=
 =?us-ascii?Q?Ex2XCsQjfL6f9G7ZV18sqc4CfZ3k3j84E+IguNEte4esANtTYrxvvSePvkxK?=
 =?us-ascii?Q?F2sFK5tcG04290ar5NzobWMT1uD2sodfHMTnwOGB5YM+GrZ7csTVl4bKb0h1?=
 =?us-ascii?Q?ofmaNpGD5OIMGxveGiqoI3fhnMnXinVDOi1ZZGWRPcp/E0itls7QRuz7abYG?=
 =?us-ascii?Q?DutLTObFvHhLz8znuttT/yZsyccX/+ZYteX60dm7L7yYGlz135F7uekRNlZg?=
 =?us-ascii?Q?AwueGGTWzj9pcDDjuvd+0HuE/fo22hcxCL0AaM1JIt93p440/QG6X5fUiOf2?=
 =?us-ascii?Q?voPHFU8mKmFlV6SzdK/t+fM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d93f5ff-7c63-49a9-96b2-08db04952119
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 20:44:35.4551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KoaUx7F5KEl7ZQsTuJHegWvmyOWPiyn4GCsO65M8kQxnHpy+AbfJOV6vKsMa3d8hZp9XlL/pxSPnE6oujR2m0cvGn0JUtgVL3OnlSHLX5NBzDsC0/KrKmdGQuKCQq4A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_124441_954449_2F841B9F 
X-CRM114-Status: GOOD (  24.29  )
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

Hi Douglas,

Thank you for the patch.

> Subject: [PATCH v2 2/2] wifi: ath5k: Use platform_get_irq() to get the interrupt
> 
> As of commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core"), we need to
> use platform_get_irq() instead of
> platform_get_resource() to get our IRQs because
> platform_get_resource() simply won't get them anymore.
> 
> This was already fixed in several other Atheros WiFi drivers, apparently in response to Zeal Robot
> reports. An example of another fix is commit 9503a1fc123d ("ath9k: Use platform_get_irq() to get the
> interrupt"). ath5k seems to have been missed in this effort, though.
> 
> Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I'm not setup to actually test this, but I figured that I might as well go all the way and fix all the
> instances of the same pattern that I found in the ath drivers since the old call was actually breaking
> me in ath11k. I did at least confirm that the code compiles for me.
> 
> If folks would rather not land an untested patch like this, though, feel free to drop this and just
> land patch #1 as long as that one looks OK.
> 
> Changes in v2:
> - Update commit message and point to patch that broke us (Jonas)
> 
>  drivers/net/wireless/ath/ath5k/ahb.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wireless/ath/ath5k/ahb.c
> index 2c9cec8b53d9..28a1e5eff204 100644
> --- a/drivers/net/wireless/ath/ath5k/ahb.c
> +++ b/drivers/net/wireless/ath/ath5k/ahb.c
> @@ -113,15 +113,13 @@ static int ath_ahb_probe(struct platform_device *pdev)
>  		goto err_out;
>  	}
> 
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (res == NULL) {
> -		dev_err(&pdev->dev, "no IRQ resource found\n");
> -		ret = -ENXIO;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "no IRQ resource found: %d\n", irq);
> +		ret = irq;
>  		goto err_iounmap;
>  	}
> 
> -	irq = res->start;
> -
>  	hw = ieee80211_alloc_hw(sizeof(struct ath5k_hw), &ath5k_hw_ops);
>  	if (hw == NULL) {
>  		dev_err(&pdev->dev, "no memory for ieee80211_hw\n");
> --
> 2.39.1.456.gfc5497dd1b-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
