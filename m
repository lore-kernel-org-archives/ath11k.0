Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A2BC433FE
	for <ath11k@archiver.kernel.org>; Thu, 13 Oct 2022 07:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8zFV1PqGpliKUtCvPx5S2PKe8pDa0nKoSSKKVou96A=; b=tGVv2BjVdWNGIr
	g1YJB922TABVAbbRrMRrfQDbtxCZoC5FYa1Tew7O8tLezlPn453oeK3pEtX98TgiW1WT3N5sNwVGo
	pAfQNrodRe8niz+uVfQzZb6FIwSvk4VKEWu6O9jCKXgdJ6y0N8fIP4fKE4piFw6PYjtzWo6VC0Ynq
	k+LeTX7hM0IQYaCor/qGe/hgomv0fPF9pxjv/jBYBGOGPyZ0kYjLNO7/lCr5NQY+K5VUXU0fK6wTq
	RQWrENn9pwK5vYOaE70CdojP2FSa0vWuHyu0InPBoLQRqpWQWK7Q3pULTE+5vaI9fJStTFuakjgb7
	PPQyNtRXiR0hRGkFD5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oisK7-00AwuY-H9; Thu, 13 Oct 2022 07:08:07 +0000
Received: from mail-eopbgr70071.outbound.protection.outlook.com ([40.107.7.71] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oisK1-00Awt1-E2
	for ath11k@lists.infradead.org; Thu, 13 Oct 2022 07:08:02 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=TQCtqzJ/0KVYnlGOYlixXWCUFIghhM17lhoGnQGZcOBjXK/D+b/3tE5xvOoaf5dXwQFSdFsyW90N31G6BkVUZz8peG8dvv7ew6w8qgb+uJK1Qcytr+5AiGqU7VUUeFNocPO/8aM0PSdiXdsTTcc2hE0zxKv+NLD1HTwYvey/86fZ74kpZ7iNnHsjVFv9dO6+UYOx89CDNeuxxXbkL5T/kvshSB92CNvicZoo9ShEq2qjru0QxGcI0OHbzt48U4Lw/YUGp74227AIhHRaRGg423uYUtQpxf2rhCafD9/itlcRpoYTYhP5HCJEaBXZIfBZSLPTIKCEwdPa5bsilKJB0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxHQfCqHdYKbHZ2QlNW9ZEG2olkqIzTvDfY88SCq7m0=;
 b=h9YaMEe/WhA/CIRiAOWNkH8+p/jwhOFV/m2zBj4psBj9sPxAV1dV2tMtTevgcDbYIE9Lb1SRymBniT9iyVh7hhP0vfmk+8RX2egQr/2PvXN9+Xdq2I+UHsAvTkAm2h4RS+Bib8M7R8DGqyL95aiTLbzD5p7s5m2Z+72NOBgL4ahubkpi5r/kyFiKwqwZBHhoMTPOEuL43cj4Q1UAKopy9yLdan3JEoEpUqZGDbzEtJb9fL+Ys5bKVCIiDFzYcYbLo9F/SohZH1/+0fSN107Ei6J+yQtSdgQU4CW3AmWJV3XVkHMOQLUppdkJ4TNqzIrcaeqe9jXBHRTUxXJzKoulhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 52.138.216.130) smtp.rcpttodomain=kernel.org smtp.mailfrom=wolfvision.net;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=wolfvision.net; dkim=none (message not signed); arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxHQfCqHdYKbHZ2QlNW9ZEG2olkqIzTvDfY88SCq7m0=;
 b=NjpRRYwZpqpodIjBECyx/DKRWsq/hE8WfUwWZTyFACuJDmgTvlHJwSts6mw+FnMNoa7PpSIg5oLmwQRBn6p7v8aXJ301pLKJPiaOoviboKBa22TtDr+xCEdkDIYP1ImFQ+drJ36JF2XAOK8KHwx3R8yt1E5xEP/kX7RLTG4BiI0=
Received: from AM5PR0502CA0011.eurprd05.prod.outlook.com
 (2603:10a6:203:91::21) by GV2PR08MB8368.eurprd08.prod.outlook.com
 (2603:10a6:150:bd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Thu, 13 Oct
 2022 07:07:53 +0000
Received: from VI1EUR04FT058.eop-eur04.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::b5) by AM5PR0502CA0011.outlook.office365.com
 (2603:10a6:203:91::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Thu, 13 Oct 2022 07:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.138.216.130)
 smtp.mailfrom=wolfvision.net; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=wolfvision.net;
Received-SPF: Pass (protection.outlook.com: domain of wolfvision.net
 designates 52.138.216.130 as permitted sender)
 receiver=protection.outlook.com; client-ip=52.138.216.130;
 helo=eu22-emailsignatures-cloud.codetwo.com; pr=C
Received: from eu22-emailsignatures-cloud.codetwo.com (52.138.216.130) by
 VI1EUR04FT058.mail.protection.outlook.com (10.152.29.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 13 Oct 2022 07:07:53 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.50) by eu22-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 13 Oct 2022 07:07:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxVVzfXTLE/SHjd3IeAO+9LcTvnSIHOMZ9UWg9EkL3Nvf5zV4uMJhYvDLjAU/R5bggI9s//YJMsk6SYu1K+9iUGNOdl4NzayQWVX206hIaE+x6UXFv0EB4mZI6TUwmkApSON6lbk699Vwe6o56HNFnk8cwroDBFQIobo72mz9KQPIlAn5uXb30HDJs6GcWwseeUXatXcrdyqJIUhqZ76IEuYp0fvcmY4CSEZLDCgW5fYLdEUBU4Qnf/BI9GzQVOIzkwJ2Szhm+HRVlfpf34D+VHWKaJ9Cl+1Y+NgISFeQTctHL5Z+6ERTqx+wuTgi3Phi1abjEPvkedG89JpKq/5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsSH4z+mpqkyUN16P6ExONtDeSTHlo4FnYA5mzXCzYM=;
 b=do6PaZu5RK1LrVyPJgHswHbFuaQQ/OBmcRymJhw0IWoDL8uzEj5N7yTbLKYBWMR2hGR2O3EqXDlxCuvJvSH1SRJ/ZMVLAl5uOBAy9zZy/xux2vTjUEFzx7enQtD5zzG4uaP/UaCHKzsZVAyOAKABX7pHHws5dUyyRWzwnPRbe7Ca9z6ImZZdgJYhG4lPZf/PMlHV/u5aMog3gzj1C8J43jtGsjGa6OIPeHaVkz890cGXtvl/cvb+S1bX1YiXP2hgIamVBZltFjJi3gZTyGwcfIxQEYKYd6uaUZmm5Lnv5xwmv1bvDbJY5u60fzBgO8WXuqjIakIFJsDds2aVLp7+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB5197.eurprd08.prod.outlook.com (2603:10a6:803:106::32)
 by AM8PR08MB5714.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 07:07:49 +0000
Received: from VE1PR08MB5197.eurprd08.prod.outlook.com
 ([fe80::331d:e530:c32c:3df4]) by VE1PR08MB5197.eurprd08.prod.outlook.com
 ([fe80::331d:e530:c32c:3df4%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:07:49 +0000
Date: Thu, 13 Oct 2022 09:07:47 +0200
From: Stefan Ursella <stefan.ursella@wolfvision.net>
To: Kalle Valo <kvalo@kernel.org>
CC: ath11k@lists.infradead.org
Subject: Re: ath11k kernel drive p2p support
Message-ID: <20221013070747.GA1602317@wolfvision.net>
References: <366bffb7-34a7-4cd5-9c38-aaed66f66e8d.e0c24246-04d4-485f-8d5f-1cc8fbefd095.9ab7b34d-219e-4d9b-9875-0a3089c8bf4f@emailsignatures365.codetwo.com>
 <Y0ZaJrhX58uyWh9E@wolfvision.net>
 <87h709o8k6.fsf@kernel.org>
Content-Disposition: inline
In-Reply-To: <87h709o8k6.fsf@kernel.org>
X-ClientProxiedBy: VI1PR0901CA0096.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::22) To VE1PR08MB5197.eurprd08.prod.outlook.com
 (2603:10a6:803:106::32)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	VE1PR08MB5197:EE_|AM8PR08MB5714:EE_|VI1EUR04FT058:EE_|GV2PR08MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf32eb0-556d-461b-ec2f-08daace9a5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  32oTjgsjTNLBxtEju5EyV1AwIsjIa05cwIkGIa1tENU0ySEo9IWXA+MoHor1Py8TkI/8dKsbskuomFiTI/b3Cvr1lWUH7oxWG8UiXk79TbNXLIBomUGqg0R270D6gGfT1ycrjKEbjAIBd/lvkhOUStzM26Flppr0oJCNcJPDt4Mg2JhZWNHACX34lbH8oLynEHKBVzDk0c+3EwuegIvxZoQSyHZIQCjCkKT3+zDyCynLGatG4BDwebG4LDCR9v+PktnhTv2qkO9R9C16QL/WrpMPpxRgW6BX9ud2K15CD2A4YjoGDZKV/CtIkiQSnvEhrCY7uLxEwzrq7qRz0XWLQXATVobJRWwAk0Z1kpSjE1RXSl3bB3KiEzRZsHN/7y59zew/6qCAg2X/kIfDNvdO+Li/DkWrT+dpJm1QhpUlSugHjxY61IHvgrkU1Vo6jboKFXUObnm7zROeh/Y7NUmi/hhB8jsrh29MJc8TXrV1Zbq1mmouyCAYXnp2pybpLpFniCsaSKz3raV8ZOfCtHy+6arZlHStgjNq1+rAYyL0mz2PlAfZXE5Jd7ytsieb09scEEqlhc/ox4/0g+x2XxDe2N0hwyluLsh7VOUr/oruOFpMu2ozrQkgBQkS8dPcUCIZNA1GNQCSCu+Y0UQ8UaOtFy9Ah6qM9O0wwigTyfLpvQPjmOuGzBbrGs0lCW9VepCopMms+7KmYWqVB8P/5BM+7RVfJ5qIUfCB8EjokrF5z91dyH8/FcX8JWNjT5WV7YcYLE9DQ0AOqRXmV7JNqL3leg==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5197.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(39850400004)(346002)(136003)(451199015)(4326008)(66899015)(6486002)(38350700002)(478600001)(38100700002)(316002)(6916009)(186003)(1076003)(66476007)(66946007)(66556008)(8676002)(52116002)(4744005)(5660300002)(44832011)(33656002)(26005)(83380400001)(6506007)(36756003)(41300700001)(8936002)(2616005)(2906002)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5714
X-CodeTwo-MessageID: 5abf5f70-437f-4dd5-9b15-d328daf8e22d.20221013070752@eu22-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR04FT058.eop-eur04.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	ab8c908f-14af-4cac-6dca-08daace9a335
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2R3BfteJqhapTCo+RCfP3z/o/rlScGpvLk2hhyYcacCLgfFnr6uDJPTG2FM/7nJmQjnicr6R+LML8rLEtXHEMumjxp6xfnEnt1IzpInOiZnRii+idA/+6lWynB6Tyg/lovf96R/KcZM9RUZdhn2gsKYNQMvhLV5Rn3V+6Dq8mJP9WGD8cJuvh9nYmF5SQWe2dkHoDgWps/bA9ccCYK/NFXTk/ZrqD7G0PW6kHFXKoxACoHybgeBMGY76rjI1dqpZlF9FjzOD4BeGB2WSJPcc7pl2GGuwZ/sYtUNJjiMpMAWOaZexkbt7MqOb4rc+88PRJ664e/NhLMzUWCyYc1Xl3Bm1X+RF+5lzJCJlHHQuEuiFP4m14emsE8T89aqD7Y81Gog19vJtfiKc4b91Ovyvphku05f+RFpLq52oLACJJc7lpZjvy26fDRP/UJKb2un64cXoaDs67RW//io4jNe2mJ559YWXtUBpOjLpzUryyynf3EU79cHa3uwgzc6mmGSM0/VI2RffMR23rb/a7vVx7rG/JVEn+cZlLoi2fq1W6ImrSS9XI3Ha1hXKSuGB3XBkp9pWIKnWItp8fS1UetWrVGz4t6uHg73J9QdqtmgkBFmvs2ID5UwIGNbxL2IT3SJgTqr11KCFG71PDVeHvlvUoU9A6NFruDzm20JabuYPW7vkH+tCxCmplD9yywogDS8F76PsS4SwVCmOy78XuawmE9d/bRJ7o/b9MhHqVbPECjffSDewX73guayWHzJdKH7Q+pP80P/oMbRJ0bKsAn/1/Q==
X-Forefront-Antispam-Report: 	CIP:52.138.216.130;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eu22-emailsignatures-cloud.codetwo.com;PTR:eu22-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39850400004)(451199015)(46966006)(36840700001)(6916009)(5660300002)(336012)(6506007)(47076005)(26005)(44832011)(33656002)(186003)(83380400001)(82310400005)(1076003)(6512007)(316002)(7636003)(36860700001)(4744005)(40480700001)(66899015)(7596003)(356005)(2616005)(6486002)(478600001)(86362001)(82740400003)(41300700001)(4326008)(70586007)(70206006)(8676002)(8936002)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:07:53.1215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf32eb0-556d-461b-ec2f-08daace9a5a2
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e94ec9da-9183-471e-83b3-51baa8eb804f;Ip=[52.138.216.130];Helo=[eu22-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR04FT058.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_000801_743672_C0173AF9 
X-CRM114-Status: UNSURE (   6.19  )
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

> 
> Unfortunately it's not really possible to give any good answer as plans
> can always change, though feature requests are very welcome and I will
> read all of them. It will also help if you can provide more info like
> the hardware you are interested in (QCA6390, WCN6855 etc) and why you
> need it (use cases etc).
> 
We are working on a new product which needs miracast support.
For this product we are interested in the QCA6391.

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
