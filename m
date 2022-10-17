Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00229C433FE
	for <ath11k@archiver.kernel.org>; Mon, 17 Oct 2022 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfw7HG0uyUoYU1MDPjWi2Z6Vv0DN/2J4AeXWV/yDn5o=; b=QPhbzZfmAnwGXV
	zDDiKP8+GJHc0JHHT8iOW+78g9/zWwSEp7idsMtH+a8NrgTfC1rV1wJ8XyEhyTXCMccMuDiO7Ir6u
	yuMG0XC2VFb4un+cg/2f3xp+zZOCr+jnbkqqX3cEB7kRyGGhs+nPtrMXpKZor3vNHeR5mLv15/aoB
	X03hDC2YbrPWTqTc/tmyaniZOXZx9xMMQSyiBmdMTg6FhGR5X5gIWv0LAbSDRcs3G3YL7m80fgwQz
	hcPAj9Rn1INl80J/JkqH79+3HyvxJhtRbisbn4sPTk3bD7It8XzEe1+gDPkRbwN3aIx5ufsAH2iIq
	ZY+40eV5WBhe7u4pB0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okN1j-00ADIr-SP; Mon, 17 Oct 2022 10:07:19 +0000
Received: from mail-eopbgr20056.outbound.protection.outlook.com ([40.107.2.56] helo=EUR02-VE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okN1h-00ADHh-6n
	for ath11k@lists.infradead.org; Mon, 17 Oct 2022 10:07:18 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=S8WsL5Je/Xtjm6zcjVnrtpXZwZYCy9cxIB+BlGi95O7KbZmdqWk1i0czL0MQAdeTFehliFFEMULxm63POY2kJmBFhbJtmH+RDBd/UOrKqUoopHx8tqASmdKXear/t2rL0OivSC9+JOPlQVB0WZ7zEsU8G8iJeKmECzNIMojZktuW04dR6JC3vjSp/rFoswDmJxeiXazQV334gSIf+Zxz7McuZqCvqAGBn0xGXTHSyMOecYvDuQfp38lfYLNROSy5NtP1GdLil8+WgwjMXbUdJBliAiZANrzku4ROHoCkjj+X4j23OD9FJPv+pyWrOAGoWdzfLQsSA9fiL9/tCH+3dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHRPBBln8jwXsk3cm7+YBEufUdN4v/CfNZCc1prTWKk=;
 b=ZCjKSnvgWzk41Z9H8WWq76x5Rtre1kXdSnk6nHLjQi1BYPRdlOCr1VOWKOwoDMsRt3kZiEsseUK5FLvoA/NuV7xmE7kUZRjPLB0GRtqE46qeBZIkUFHkV3A5YPZ77LAVffEWPWHdE1ryqDjQtldR3zffQQzF58FkRYL51HjZ7kITyUMhpoEubESuNfB+DFIsHC3KFIopvIr+hTwgcSuZjq60iBsIv6MB6Zff7pumqXZkHi1araTlGeORTuLvxolitb6bA0DFP2tdCQHD5dV35ePCSEbizbIteSiKiYDSeHXVCRUth1w+Gu2GZF+ORE8Ywei8I2Cb/mbL6YJcetKWBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 52.138.216.130) smtp.rcpttodomain=kernel.org smtp.mailfrom=wolfvision.net;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=wolfvision.net; dkim=none (message not signed); arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHRPBBln8jwXsk3cm7+YBEufUdN4v/CfNZCc1prTWKk=;
 b=gIkwXa+0trTbIWz1YqkxkpKXh+a4dDfNwKwFZlwXikl93PdZgz392r6DSyUm1CtOK2ozz0b48XoU1DxHT31flw8xdOHBYaCq2jeiyyjxSAWbRLe1NeBPG2FQUB83Uru0hDGF9n6SKabM6U0Luv+FFZMAguWfFq8YPHrFTEajKVA=
Received: from AS9PR04CA0093.eurprd04.prod.outlook.com (2603:10a6:20b:50e::21)
 by AS8PR08MB9070.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 17 Oct
 2022 10:07:11 +0000
Received: from VI1EUR04FT029.eop-eur04.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::f2) by AS9PR04CA0093.outlook.office365.com
 (2603:10a6:20b:50e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Mon, 17 Oct 2022 10:07:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.138.216.130)
 smtp.mailfrom=wolfvision.net; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=wolfvision.net;
Received-SPF: Pass (protection.outlook.com: domain of wolfvision.net
 designates 52.138.216.130 as permitted sender)
 receiver=protection.outlook.com; client-ip=52.138.216.130;
 helo=eu22-emailsignatures-cloud.codetwo.com; pr=C
Received: from eu22-emailsignatures-cloud.codetwo.com (52.138.216.130) by
 VI1EUR04FT029.mail.protection.outlook.com (10.152.28.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 10:07:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (104.47.1.57) by eu22-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 17 Oct 2022 10:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDwC34V9OqiCSBVmLAwqwDyKoQIm3hOshnQhKrn7wo/IUPPeizqz56DIsgNongYjlEUSK/eNsFCdopfdvsFsah0LUjfTSE5wjKRJdcCV5TshhJfbMe/OLLIGFuba8kGlRTdyVHSgpkIJ0ZJRRApVdEaOUwMUtqurXX9nv8se5NprOP2Z7pcOplBOu5NlXuu5eliZVj+cFVNy/ofCSBaQMmz8iV8rlaiOpsOH1kBppuOtT/d7YQDz6z+1y/s2E99uAhgzL1Ow9kPpZuBDRYkc43NqkLFfJNWEvZK3OF64I+vvrIrfwmWuHJifqzaQuZvmBz3OeUoDScatldL/mmzRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5aMSQbKH2Y/iIL0AaDXRkdiyzuS2gLXXiHDF6wofuw=;
 b=P49c1SvGfdkXiwKDBeVInrunyQD8YSUHDz2yRnDbd9BH2dkyd9hQGn5kn9aooG4ndnpb6MdOWxZZBaS0QQPGJe1G6OUaVCVtdg3dLA4qSjYp87Gjjkgz8UjyrsOoQYGuMtRppgy5MLJ5go+Nj1CqVrdH4quDHfzXqhthFEHXGnPnegrS/rZ1ozJKeuCCbtXcIbUsqRfsgGj8cDSUn1AtxJSjuuZpXdw8bvxPrUmSQG154WCuRwQIDPKztbgAEhAafnnZpDAfHitDfCUvpxJp4aUJTMskZczpy63VA2Xr+gUFs6YFHE4xWFDDJCz2DAZ9xyzq7rUbjzncTkt532EWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB5197.eurprd08.prod.outlook.com (2603:10a6:803:106::32)
 by AS8PR08MB7339.eurprd08.prod.outlook.com (2603:10a6:20b:446::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 10:07:07 +0000
Received: from VE1PR08MB5197.eurprd08.prod.outlook.com
 ([fe80::5b2d:b43b:6657:53d6]) by VE1PR08MB5197.eurprd08.prod.outlook.com
 ([fe80::5b2d:b43b:6657:53d6%2]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 10:07:07 +0000
Date: Mon, 17 Oct 2022 12:07:05 +0200
From: Stefan Ursella <stefan.ursella@wolfvision.net>
To: Kalle Valo <kvalo@kernel.org>
CC: ath11k@lists.infradead.org
Subject: Re: ath11k kernel drive p2p support
Message-ID: <Y00pSZh5d7f477BZ@wolfvision.net>
References: <366bffb7-34a7-4cd5-9c38-aaed66f66e8d.e0c24246-04d4-485f-8d5f-1cc8fbefd095.9ab7b34d-219e-4d9b-9875-0a3089c8bf4f@emailsignatures365.codetwo.com>
 <Y0ZaJrhX58uyWh9E@wolfvision.net>
 <87h709o8k6.fsf@kernel.org>
 <20221013070747.GA1602317@wolfvision.net>
Content-Disposition: inline
In-Reply-To: <20221013070747.GA1602317@wolfvision.net>
X-ClientProxiedBy: VI1PR0502CA0026.eurprd05.prod.outlook.com
 (2603:10a6:803:1::39) To VE1PR08MB5197.eurprd08.prod.outlook.com
 (2603:10a6:803:106::32)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	VE1PR08MB5197:EE_|AS8PR08MB7339:EE_|VI1EUR04FT029:EE_|AS8PR08MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: e701367e-3515-4b96-b266-08dab0275b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  T3Sgv5LgitrJX6F0KZRn975VTSAJKoqUAsB/CcgWgecFkflIWvZmAtlf5V+KTnBdIgJFLjqxcK/H9Aiw/JsPOhJYflsGgbO6HlyINbiui/u1jzV2KXU9HPvAwxqNmik6lG81WFOWBd8j7JCncqoyVvV2xH77ErFzR8wPXh2SScEIZQg95cnW5fZqibOKKKflJ2ZxHFVaW64pKvYwJlrcTis7J2yLL7UibNs/uTtMD4qnSeo0cdE9H2XNhjBy8W7MGAymYOKnx8tgtxxHn0UpMPhIzBFyIYtfDDKtlOiGSj7etKtm6ND0YNKK64j6aEBlQ1mNlr3mSUD3JZ0quEOp39YpBsQpPWJUEmuFcm9yjaCBjVTd+CIwL8iQ8um8R+E1vZjpb8mBhp6S+ONW9UFa2jLW55C5dmz2DnYVedqrBOtINFQNWUv0+yjPTpmij5Yh330/il7WEtmyemZi4aQKqTw7tlWuuwzc0eYSmbmxPqEpBWoVjX7v1++806POOY5/aBv3N3WSS+UlMrrDsH/AOgVkoocpgTSr4fn6HMTcYapEPy/ohXVKeakpV2OFqEIA7rf3R0AbJ3z8pQPT/gpeHXUxTeMnq6odWeRQyXm9Yarpg+7OI40dTSCqzGspehbb72XZYnGFV5XGfNkj92P5dtXp9+GLpPZZFBBLQbnSaNIK/DnSv8VM+iUCPs4QI8ZGEu+WKGlXf7d0Ts2JOiYpe/rnGIVTfNtRvtS0P/8wuWb0F2CZj0RBf+PjCxfMEw80CTgdScv3tPnNXCG9Zp155g==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5197.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39850400004)(136003)(396003)(346002)(451199015)(36756003)(86362001)(38350700002)(38100700002)(83380400001)(66556008)(8676002)(66476007)(5660300002)(316002)(66899015)(66946007)(6916009)(4744005)(44832011)(4326008)(186003)(6486002)(2906002)(8936002)(2616005)(6506007)(478600001)(6512007)(26005)(41300700001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7339
X-CodeTwo-MessageID: 285a7c23-ea40-4ade-9f5a-a85aa8286490.20221017100710@eu22-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR04FT029.eop-eur04.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	6717b0d8-2b2e-47ef-89fb-08dab0275948
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RonFOvFPWkmyDvEzJ40gs0mkyTnoTF1wC9XKDPYnoAhmXuf1CudpMfl3tAUTkITcwtyce8qeHF8fwJyjNSYQyNFFmtiVVdHVrZKvrJ4OzfDjWMYi/R1WTP04QgJTYD1bnV8NA64t7AiVUqH/+09sw2NSJSsiLGykoaJ0OJudwooaR/htHkvBLXQ5vFTxGJeS6j2bk8xywCHBaKNsGop9PCw8eICVlypa3kDtnCPXZu6LhHFxgPg2RpPtXQk97LbmYwmdd30+fpn6d/zAeKjiEZmEdHXdkTXxGzJGjF3NvYweDGjv1qVo5ndZhIqkpdEFlG1PtRrKrruMItGZSNZdRm9kCIX9KbN8HgRWrUqlhu9dit3W4QgB/eVbQMwUyA8FSStGIsBlfdWyuN9YqZjp+lEOOYLT+Wl1gQMJJEspG9H1QQkseU6DZdFh8TSHXuABG5XtHnjGduSr0okNAO7mjv0l0LWz1vJdMqoru/b8pWDARaSXdHx8hfYOmAibnmzP+5eOLnqfI0/Xpap3xYz0OlTPqnOlCzKOfQQkW+O0qHHPc8XWJx/WCsSZ7An39xSJZ30f38iGOspOIzijBUBtiC6007nggFR3QOzKzZOEF7OTbUtSB3kP+5GuQDWXAh46Z5IZoPsRnEz5tDHSX5l2BkdS1G5V724l0gVSt1q66yqX2es3vT4vc9kKC6Y+CLjFPwbqtR+WisIs18a1L9zHdlvPczXwA09cZXFoXgsqSVXkeAz8cUsTNi6J6eO495GH6A2ck4tofLwY5KBKBZC3Vg==
X-Forefront-Antispam-Report: 	CIP:52.138.216.130;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eu22-emailsignatures-cloud.codetwo.com;PTR:eu22-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39850400004)(376002)(396003)(451199015)(46966006)(36840700001)(6916009)(40480700001)(36860700001)(316002)(8936002)(5660300002)(86362001)(6512007)(26005)(47076005)(186003)(2616005)(44832011)(36756003)(336012)(4744005)(70206006)(70586007)(8676002)(83380400001)(4326008)(41300700001)(6506007)(2906002)(7636003)(82310400005)(7596003)(66899015)(478600001)(82740400003)(6486002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 10:07:11.0142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e701367e-3515-4b96-b266-08dab0275b7b
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e94ec9da-9183-471e-83b3-51baa8eb804f;Ip=[52.138.216.130];Helo=[eu22-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR04FT029.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_030717_495687_144C5B28 
X-CRM114-Status: UNSURE (   9.00  )
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

Hi Kalle,

> > Unfortunately it's not really possible to give any good answer as plans
> > can always change, though feature requests are very welcome and I will
> > read all of them. It will also help if you can provide more info like
> > the hardware you are interested in (QCA6390, WCN6855 etc) and why you
> > need it (use cases etc).
> > 
> We are working on a new product which needs miracast support.
> For this product we are interested in the QCA6391.
> 
is it possible to pay for this feature so that you can accelerate the 
implementation?


--
Best
Stefan

Stefan Ursella 
Research and Development

Wolfvision GmbH 
Oberes Ried 14 | 6833 Klaus | Austria 
Tel: +43 5523 52250 <tel:+43552352250> | Mail: stefan.ursella@wolfvision.net <mailto:stefan.ursella@wolfvision.net>

Website: wolfvision.com <www.wolfvision.com> 
Firmenbuch / Commercial Register: FN283521v Feldkirch/Austria


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
