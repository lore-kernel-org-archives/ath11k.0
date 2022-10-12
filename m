Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36893C433FE
	for <ath11k@archiver.kernel.org>; Wed, 12 Oct 2022 06:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=ZaNq0NT+VHd2UbEaPHUANo4+VLzLQucXBdW52mOpjCM=; b=u4YGXdYNm8PjhJ
	kvxntpZZEsFqA/rTksbi8c/2zqX/6TvoUamhYBacHbOLdAizTNjA0zih6yRvMKsTDX6hzQYwfxeNd
	25v63lx9dsdiGX+9/iDE7Y2TTm9wkdHcsD5XJ+LGNPEva0xnxvcgkiHb8Ct5kktklyMplS30xQmLy
	pLQNBc9RcqAT0WgZLyOEWrsnidqMOPu+MRxTR62ND7+UKm5zPwJRxk1uAuCGmgmwIhAMh4rbTvKhA
	iaFbkHS30h39OQBnfG56Dvuq8VnRM3x36q1aRB/fEHoJS43li6j+UlCeGIg3DpaP0rDqiIovAxKX4
	aqz1W7etnzLN6I4VxKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiUwH-006zsK-K7; Wed, 12 Oct 2022 06:09:57 +0000
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiUwD-006zpN-Sa
	for ath11k@lists.infradead.org; Wed, 12 Oct 2022 06:09:55 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=H9NYW9poNpxgmlgTP1ZNmVH1cb08BcZ6TEBjdDdLyM5MLeu1SaIkkElbTLCznZ3dVfXgasGy52nCFS/yZYqguRnACgryZa5ZdnveWKyasEHuX0+PaPlImqoT63Mbr27dPl9WpatGUSaCCjzYTCk9NU8qL31XmkSDoxygYjskB8abeZdn7eGzX2QTjXxdoYzJ28PGvvGnN9gn0tq2swQtJU2K8jPIV1/5fsEGap30CEIUX7VXMsjCYcQLk4E6akv0oJjN1zObO3wrVdbaC0dQ/FwChhfTB6IYBWDhaK+xcOYu3tkSizbCI3z7G+nlRfds7esH6iYApmjvb0k5apW6zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw78GAumqS/DfMeSiGiuwPx3+Fqrbsj2LF/s2UYHPC0=;
 b=XyTZXjwRYMFE5EIDrBr646e1FnQvTtgnG1Isx++/wETh9imsoBtCpz4rh0E29yi46RAzPA62rIld9hi7Vew8JjEWm/VbkDj4XmfZM7QvCkzSE66hTAL1+X2VSUl47Wu47p9iYisolwOOo1Ga3DB/3L1yleFnS8kItofKl1+x/Y6gEoLxm+ewMrv3JOJW4FyT5W+vVNRdyc+xjcq0okzJgQEz60PALzoOK0ZpcXGJ8b9BWjHSjG2ds/7tuve63Zwyso5ZlFuZT+7y3db0Z/rywgMdRE34uET06F8PyAA3/9/tAjOxfX35HD0nswDUd5SBs70wlrSfLVUGsAUjEBV92A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 52.138.216.130) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=wolfvision.net; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=wolfvision.net; dkim=none (message not signed);
 arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw78GAumqS/DfMeSiGiuwPx3+Fqrbsj2LF/s2UYHPC0=;
 b=OK1QuSJRO6P1yyel4rTLlUVn40UnFKI06yvbt+lShqSYeJbhBX9OdYgO8rfQ0IuyStr06WvhmhoEbddCu7WlyjfRi6KtG04WucExdhowCqwl42QFJbZVtQziG9LRG3JpWnYnBWrmTdv6sUqrmEUwfGzcdNGoHC90LMb1+n7AbUM=
Received: from DBBPR09CA0035.eurprd09.prod.outlook.com (2603:10a6:10:d4::23)
 by PAWPR08MB9831.eurprd08.prod.outlook.com (2603:10a6:102:2ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 12 Oct
 2022 06:09:47 +0000
Received: from DB3EUR04FT004.eop-eur04.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::fb) by DBBPR09CA0035.outlook.office365.com
 (2603:10a6:10:d4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 06:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.138.216.130)
 smtp.mailfrom=wolfvision.net; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=wolfvision.net;
Received-SPF: Pass (protection.outlook.com: domain of wolfvision.net
 designates 52.138.216.130 as permitted sender)
 receiver=protection.outlook.com; client-ip=52.138.216.130;
 helo=eu22-emailsignatures-cloud.codetwo.com; pr=C
Received: from eu22-emailsignatures-cloud.codetwo.com (52.138.216.130) by
 DB3EUR04FT004.mail.protection.outlook.com (10.152.24.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 12 Oct 2022 06:09:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.55) by eu22-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 12 Oct 2022 06:09:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gn0vyZAH13c+GrfX2/mRjg1UOI/KneDGSj9Tqh3jXudhhPFk0P2V9hSxveSwLj5wmHsi976sqhXnJJf8luAYj0PqtKk/cQIz+biffrwwYVo2fESiqN625JvqQgl1BMmrHLCaWVRUz55QlMSSezhr6saNbQLt3MaqpdD4WS5fPBUNa9yU4unfBFIRxLk9sMHbZae7fPgjnyLKbP7znM1fbIcR6eK5q2YFm1rBUEMeIPPhYofbBJFnF61P6nQ3lA6cxxh4YEALeELBuvqLGsiSlVYC4Q/IIMBvqrSBB/X1eXwsOI0oUcrV6w0799E6TamRHBdHjPwYMZuNB+PPA2Gs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHsnmJSbSg5i6IvZOxlmYL1Tzcv2XfidlkgoPnH7mVQ=;
 b=kL7EMq4uU3ENuXz4hxtt8EFj3oC8HsQpHoZerK41t6xWxn2ktBQM54VtliIjDkyL052brCkPLnT/oWI06X1wUpUZuq7guSQqSxmE6v4JS4azxxA1uyjt6ikz7vsyJ7npv1S0VG3+fb2APAAt0PkafRGuVtIFghssEK8tKCNtG6mbL/vTgw6HjWvAgK1DfP0dyuNI0E1LLNEMrAqgVjRbNoLBd/rNePwIut6d8rQfKkBnX0VuDwZM8SwrMX/81zOcIalOikpS8KsBzFRrKqBubJ+B1RUIoydm4CN/HZxjACGtkEOM5ozUbIfQRrzGjAdAjEBuBphED5s8yfLHYWT9vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB5197.eurprd08.prod.outlook.com (2603:10a6:803:106::32)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 06:09:44 +0000
Received: from VE1PR08MB5197.eurprd08.prod.outlook.com
 ([fe80::331d:e530:c32c:3df4]) by VE1PR08MB5197.eurprd08.prod.outlook.com
 ([fe80::331d:e530:c32c:3df4%7]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 06:09:44 +0000
Date: Wed, 12 Oct 2022 08:09:42 +0200
From: Stefan Ursella <stefan.ursella@wolfvision.net>
To: ath11k@lists.infradead.org
Subject: ath11k kernel drive p2p support
Message-ID: <Y0ZaJrhX58uyWh9E@wolfvision.net>
Content-Disposition: inline
X-ClientProxiedBy: VI1PR0102CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::45) To VE1PR08MB5197.eurprd08.prod.outlook.com
 (2603:10a6:803:106::32)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	VE1PR08MB5197:EE_|AM7PR08MB5381:EE_|DB3EUR04FT004:EE_|PAWPR08MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 8937ba32-ab0b-4ac2-93ca-08daac185d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  CTB55BZ0YA5rgW+Aucx3SlIziZdwUgMi0k/Rno2bWoJlD7q4HVfACS5gHehcRKAOgODIlzCxvRzXkxhK+LYotbESberhBp98dRhaIDNwPm1R7lnPTjWPQKpQC6JtyVTGg4ClbLbiJmZa8sej0E+DpIcNO982rJ2CQbykOUhWkE16GC84O27OpU3NbpmnknDYgSJZgeKJ9c/KCnlYwlr0Y3AoEu2G2E5IVjn6mH8p8z3RYMICda2H98cHsbRoqUnaTQ4KMun7kJtZ9Fbt+czBcpLgP8+7jM0SbObLDvRy2C8aAtumkSIhnBsjOxohZP0nxZ0w71StsL9dmSiC41LdrIy+kPFURHdHC/7ZsTJhQFzt1CHr2rgbMMh4/aJdKaio1j4g88oxPqAHQ7advtwkhbc21M3dd8sROg1hPZ8bL+SkjQJWrHXNxmlEPT6DP1oW+wVspgTDtppGzUpckrnoHt9jCyzN97CKL99q5JmM4JIFC01UII252+wl/1puY2dtmzqQSOUD3j9rbjWq3yBkoDt23MNlJTuZbYbATxXnGpfgs3NU26O3FsHE+UhLaIUdhoEYSVZ4eFtSTmG/7c8l8V89Aif5moYaOpBc6iR5F48C1ZKSn//wrhK/QI6ESfER/7MxUHbmzDYK4DGS5lGyRI/9GR+2fD+i6//UhfDC0Qzr156CmEJL6kf/yT7mXdcPF9ToIiF7xANKCoh3w/IVhM1sP4bszqNZGDM/3DC6swUJ4iu6C803Qz+ioAwIB/YfMMwA/AEGG+Oz/RVrM8E1tw==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5197.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(136003)(376002)(39840400004)(451199015)(36756003)(558084003)(2616005)(52116002)(6506007)(6512007)(26005)(66946007)(66556008)(66476007)(478600001)(38350700002)(8676002)(38100700002)(6486002)(86362001)(44832011)(186003)(5660300002)(8936002)(6916009)(41300700001)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
X-CodeTwo-MessageID: b68dc0c0-8a2d-442a-a269-b84aa046054b.20221012060946@eu22-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <366bffb7-34a7-4cd5-9c38-aaed66f66e8d.e0c24246-04d4-485f-8d5f-1cc8fbefd095.9ab7b34d-219e-4d9b-9875-0a3089c8bf4f@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB3EUR04FT004.eop-eur04.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	753240a3-c424-4237-530f-08daac185bdf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kIh++6oMvEeQKs+PeurxZJNZtLOOvSZys764NYiy4AiP7kom5mVOTaAx1+qVGf1a04LVEQ3B+qptnempwuDTQ39CJuc2WPLyQpAR4Q1m3knXrKaLUKk9gqs35zmxX9mMxxfEBbP9a3vEekqh5G82654IBichrj4VUuO2K42RkEe50IxVFyXGKKFhEUzdSBcZKX2+Eh4ALAEta4Iq4RPOYdzIbn7v4UyYnMIUIemLZE6d//RM1ETOHf4qKWt9DbetD1DpXk/ykKQItcBSWziVBw+dRl7KqwpLEoFfBBNd1kWrKxI9uvQmh1bguf48IBjRQa+GcVRRJMrz7V/Pt1VNqxEO1D8+bh1w4D2sLRQZ09uir/EuCgHYb70IC5f6Za1jS/c42mfC/glv+KOrBdBiqeEBiSPTbDrzicvZdq2uJW6nDYVmcuBPE89w7vSK4CIJ+5gsYEwK2bqhdaBA6IGYbxRXOkQ3CfTMrV7oWb1mVyIGcDq1KertAXq0GoXvvPuou3sSXlf3asSjet6B6tzAiOPaFJGABqnEmKscMzl426kKCAMid5vIV6I3YKRfABv0g5hVYiHdpyPBzLGuF6pczhqI+LfW44gM66HzEAmbfVQg2QviHI6A/N8UmM6W1vt9Sq6bc1tZJtqzSMVhQPvFVXuNYSgaTJbIvGbjVq+FZqMbKEsQSZ3rR/RpqO2PAn3j+I3YCwDjNE4kK7aPBiKNOLv5PMD7P2tBCuEP+VpDYxwyvcTmYpzbMtUGEYGmP6shrIgJwaiU9C0wt707y3m8DA==
X-Forefront-Antispam-Report: 	CIP:52.138.216.130;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eu22-emailsignatures-cloud.codetwo.com;PTR:eu22-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39850400004)(376002)(346002)(451199015)(46966006)(36840700001)(6916009)(40480700001)(82740400003)(86362001)(26005)(5660300002)(336012)(41300700001)(70206006)(47076005)(7596003)(2616005)(36756003)(2906002)(8936002)(44832011)(7636003)(4744005)(82310400005)(478600001)(356005)(6506007)(6486002)(36860700001)(186003)(8676002)(316002)(70586007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:09:47.1927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8937ba32-ab0b-4ac2-93ca-08daac185d5f
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e94ec9da-9183-471e-83b3-51baa8eb804f;Ip=[52.138.216.130];Helo=[eu22-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB3EUR04FT004.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9831
X-Bad-Reply: References but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_230954_185102_9AC6B891 
X-CRM114-Status: UNSURE (   3.69  )
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

I want to ask if you are planing to implement P2P support for the ath11k
linux kernel driver.

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
