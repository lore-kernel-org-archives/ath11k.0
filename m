Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFEA606A33A
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HORPKFk7;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=JuIxBaDo;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=ZPl/yv7j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9+2HnvbQoMS1KyPd5ZG/tbs7MjHr3Gv+/wtvtUzBYUk=; b=HORPKFk77dNRozXDbB0+TgA6ag
	AZp8bVmLUstYIRlxssaEDFJL8Vn69TpZp3AV5dddP1t3yxHEgVNjk2i1c7YUBnHIKYWo2Bte1YS7V
	jNwJIIO5m/1LjZUNlQdhMLrOcfS5c9SHvMwC263PNswcWYiSPS+Sm+42RZ7WH7Sr9YtXxEPl61rrw
	9M6wVDfuFh6GatiKqhCbZ9rws/YBVyJwEuAsazQMGMP+gq/hpOv7yuMe+vziCrkMdeJe6HUB11wld
	layB+l6GLUwzj//YzuRaayWpbmFr/pBd8MNnIuVWTwH8H5jbH4aXcBy7E9bYplPclgAGu6+QTAnUM
	EIK+sPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyOD-0000000BODP-49GO;
	Thu, 19 Nov 2026 09:25:10 +0000
Received: from mx08-0057a101.pphosted.com ([185.183.31.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyNC-0000000BNwG-0EQn
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 09:25:08 +0000
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6wEsL606827;
	Thu, 19 Nov 2026 10:23:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	9+2HnvbQoMS1KyPd5ZG/tbs7MjHr3Gv+/wtvtUzBYUk=; b=JuIxBaDo/ibKmRyW
	WZisVr13OGI6u1xy5BBmyoJdga+Xq0isCr5vMtjCORZpKjEXGg25UbejBI4Fft3o
	/9sniz5TVKrRxGSHHL1P6u7XPMo7wJCKbNI3m3AGEnc/7Ll8JPbv5+oOdacZIwbW
	bZirl/f6Iih18vH4hlUxptz8zL92nTkeEp5O3vuJndkZcSfCt2RaU5weW9ln35xj
	+ergc66WMDdd92LnvG7RboyCKw5X1NLOK+3PEd8OktnyIVIbt8n8cqeECF9nbfgq
	kJQ2NBZs7Yj6WsPinEhE0qlKKvlq1fLWwgyy/AbpSdo2ZZweAuHgbdWVu+JnrkI+
	XxgMAw==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022097.outbound.protection.outlook.com [52.101.66.97])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qjqrc4d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 10:23:52 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7VToA9kURthhcv0B7kQCF1eHADmkIH9iqYw81OMGjQon47eDudKD59EJpcC9iFk/o3NSGrKk7Sb8OpDfCE5rIlOPExfR1ZBysQKmpgzTijlKWLiNUW1gmg2Mp16X7HpqKoiH1vggSoBEtj1E8ZxlemhWd4gMS1S1za6RwOJivOlzaWilDpMck/jnJlTWT2PpXZ+ZSQeQfXR+iSLvYchs+MO8ZBWAb+DjW74IgbOrCC0IRMwmvGqGYr4smCZDoTVLc9SKkIor9z4zn8xXR7bo1nrBTkx3L8lItnw+T5Kek/mrDL39i8XLV99GW7a71MY6w1u/BuTCNzup+r2F0C94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+2HnvbQoMS1KyPd5ZG/tbs7MjHr3Gv+/wtvtUzBYUk=;
 b=duyTbXPgYy2e6Uf90J0SJ+bE3kj7T3xG/xhuxKWOzmn1I+XmpH7qhb6P4l6UCYxAcKQEBW9NUHkJ5ovGbMyTkkuMhnZ1dKtN9vDtnEkY+nj0m9JAgbBWWO8DMG9hETlWRIKHVlJCJ/Eag0d28xNUHxp1BSgEa/OL81qkMZdyctZJeFuGf07keCs9/WCKlYXVqtM6VqJGvkYgsKBexElGAtE+M8XifouE2EtQHXQqy2s8AUjuuxtX2mRShC1TzzPqW9nTmQVhU38b4i3uZwrOXwDvbZGxM3KIleT7xOijrMxLv3REmG0sa6JJvRdsQ95mUSeITny+blzmcja6q4TACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+2HnvbQoMS1KyPd5ZG/tbs7MjHr3Gv+/wtvtUzBYUk=;
 b=ZPl/yv7jGOv/UjJZt6R9VsL/3tTwJtH+KV4g1qn60IwppQAi2Tv84FZXk1hhdNIJjLeMRrmVcCExbiZ282TbdgLoXdclbPK+q4z7O43QJ/DLCitH9HD49QWFTH0G/Mh7q3k0ix926ftubrEseNN/eyUmb3HLkjYD/2mLOrf1j0o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0893.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:23:50 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:23:49 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 19 Nov 2026 10:17:56 +0100
Subject: [PATCH RFC 4/7] wifi: ath11k: convert remaining HAL descriptors to
 little endian types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ath11k-support-big-endian-hosts-v1-4-c82fe63f9859@westermo.com>
References: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX> <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
In-Reply-To: <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS6P279CA0096.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3d::16) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bef1d38-b754-4b31-e765-08df461ed200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|261022115727099003|4143699003|261026130827099003|261026121527099003|11063799006|56012099006|261026140227099003|261026135527099003|261021130227099003|261021123027099003|261022105027099003|261021121427099003|261021133027099003|261022075727099003|261028144727099003|261022113327099003|261021135927099003|261009223027099003|261009221727099003|261009223327099003|261009220027099003|261009221227099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QWRso0Etmup+51/dM1avQA3aSlPRWg5itp43CItQ/zOhrDsdTdfLqegXf5gZfzCzIWziyMO/I2VHyJ6oDj+tpPG2z08AfqTos9I5o/KvRm3jmwW0PZTpQHAtU1jsh6PF2Mzf+3CKbBtK0VZeE/UGG+iSnoU08rgMRdKU3vNZxIbRA3XaRWZ4UpxDiSwgbQ6lvQYnNv9FRkcmySACQQUnRRnA9XLraCa+TgcSpjVB1WxmeQZa29xWkK/6hj+VQSI2TARdm8ERgr8hOMYzHyKgJ/OKxG8eV6IAJqqScpvlPKZwmJk4vUpC7NpMWh6dZLDlAA/KJa1TcXXNtnCbwxAhDkYfA0V9r93ckRvidUrPGaH/9KaZUEFaCTJ32N0t8KJxqMuLN+xiFBu6hmuZdJne+5uWc2dQEg3zX6kzSYUz3MiJM9dcx5mOYlyBQrBtAAMdnxeR/G1/Y4ZiXdAb08v7IlOukk9R6SwZ4fVytV/WI3jN/dY56kp3kRjTQTi8IYf1JGRUz+PmUoQlMRMBaxFXAOF0mQkzRvfEeZpqUmybka43kaVyCXetdi8kpBMXx6fj7SSqXvGQe4crZAxCZ+ycBc59td/OZHQyss7qm+yQlAMJmHfS0zz7rPnTatI6ExnlH2gGHNpBMIpC9SMrsDYPpz1K8MnXlvOLdKAaddD2T/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(261022115727099003)(4143699003)(261026130827099003)(261026121527099003)(11063799006)(56012099006)(261026140227099003)(261026135527099003)(261021130227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261021133027099003)(261022075727099003)(261028144727099003)(261022113327099003)(261021135927099003)(261009223027099003)(261009221727099003)(261009223327099003)(261009220027099003)(261009221227099003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1R2TE1oTTFsNUcrSy9JMnlZdTRHWGVnd04yZ2VBcE03NUY4OEMvbk1lUTJC?=
 =?utf-8?B?UEpNQy96OUNHVGx1NGt0NXcweFcxSFM2SnpyYk1uaWM0eTFmeU1IL0JqUlA2?=
 =?utf-8?B?ajE4VGtyUlhadUxWYmNpbUxqKzh2cHNEY0d0ZDVaMnRabUhKaklkOFVkTjg5?=
 =?utf-8?B?T1JlaFB1TkxzSzdBY2pPZEcrK1NzaDFVL0V5NXpmcXp4c0FoOVYxc0J2U2h3?=
 =?utf-8?B?ZWpSeTVuUThibkNCZ0FIVDBtbFlzcVo0OTNCWFJqK2d1aVpPQk10UjdrMmJN?=
 =?utf-8?B?eldRYXVSSEJOYkk4ajl4QjNtUHM5cDhNaFEySjlpUzRTTTlZT2xLMEN6NkJT?=
 =?utf-8?B?SmprUDBxNU1GdXhWTTJGVXN4QVZrWDNBMnFKSG9WQ3NhRm16UFppYjFBWDgv?=
 =?utf-8?B?ZnoxamVqQ211NEMxZXp1YW90NlluSC9pY3NUZE9IUktBUU1jcjZjVFp6Wjc4?=
 =?utf-8?B?djR5TnJmSVl6dWxhaHVWN1NHZytXaUgvWGJuemxISWJBQlcxSXRPTVVKdWZK?=
 =?utf-8?B?OXFlQ1cwTjBkTXRMOXk4V3ZvV241RHpObjIvVzN1RTc5NjRkbWI5WEJHUlNh?=
 =?utf-8?B?UklDTjFiSGR6alMxN3ZBTGFZaG9VNDdJTmhIZzIybkEyZG9OZGJzMnNkemV0?=
 =?utf-8?B?aUFUVTdSWmJqRjZ6bHVDR01ZMGFUVUJJOEFuNy9lV0NjQ2IydXZkVXRBdlJY?=
 =?utf-8?B?dXNlamNad0xxNEJRWnhIRTM3YzBRL21ZeExiTkIwR2JWbUp2dEExTW5kZ1g2?=
 =?utf-8?B?cTN4dGo2cWF1THdUMzFrd1Bla1JXSkpSWjV4czFmTHpIdExBSGNLRmpmMmVx?=
 =?utf-8?B?b3FXTzBZQ1ZZUVJrbFhYUks5WEtyWEVVN01GUUxJWWVpcC9qNnBUa00wOWNR?=
 =?utf-8?B?Y2xzNk4yVllINHFFd3lXbDAxTExqaEpwdkVWQ0pwcUVIRDd0eUdKYXJXUlBJ?=
 =?utf-8?B?VmZBa2dpYkhuZ1Z2a0RHbXJvZm12WDFwaE9PVEhTWGY4OG5EeTFhVTIzdTFa?=
 =?utf-8?B?UHJhUFRPaTlYVisxR2xDOXRQRHRxMVozcjlMN3VZYzNvSGNDMGdsU3FMNFBn?=
 =?utf-8?B?QXJZaFIyOWFBbzBEekV5cUdiZndxNklwVEdzQkZnRG1NK3NpS1k3OHZXdFdr?=
 =?utf-8?B?OVRaY2FCdHp6SUYwSlBWbm5JWEx5WURrQjg0K0tWVjVDWlZ2NHlpN2dRWWU0?=
 =?utf-8?B?OEdVQ1NaYUsweW1sc1kwdGhYdHY0bStJaGE2bVFWdWltQjZVSmFHeGJaZmRS?=
 =?utf-8?B?d2lwU0JnVndJa3NFenVlaDh0aGpGbVdhSGJ0a0R3SWdadXFDaHJDYU1SWW1I?=
 =?utf-8?B?TFkyM0pPcFlPOXRGNkhYSElxVDF1YzR6c0VaVjdHcnVJeGY1OEpHRHd5MExR?=
 =?utf-8?B?cWlRT1lZTjBNVUR6c0tIbmpTVURsRUdFUFl2c0N5c0lYUnpkZlhmQ29iaGJD?=
 =?utf-8?B?ekhMWkp6N0JPbXhOSzd6U0pXM2E4ZEdRWkZEOHkxQnBvOGp6QWRqb1Y0aWY4?=
 =?utf-8?B?Z2lrT3duY1VYQ2IybU44NE1pUGJJMTNEamJwbE9qZkpLZXN3b1JmZ0xhSkZj?=
 =?utf-8?B?Yjk5eFk1cVhIbVdWNGExRlRPUDJWeXE4bGxwTENrbHZCcFZLK3p4KzFvNU55?=
 =?utf-8?B?M1pLYkpwbktPQkhIZlNvejFJZDBvMG5mb0Q5VGFock1sOVVHNERvZmVXV1ZZ?=
 =?utf-8?B?VFYxYzMycnduVWJNcWR3ek4yN3lKWE9UUlFMbVE5UXcxckIrMVE5bEU1aUVR?=
 =?utf-8?B?VzdzU05OeEFSTytKSE9qamZYYk90UUtkWWYreEVMTU9TY1RDVWU4T2hqUy9M?=
 =?utf-8?B?MEFBdUFicEtGWkRIZWxaTUFZMXhldFJTR2RCaVJJdjMwWXB3UzVzYVNMWkJW?=
 =?utf-8?B?dVZLZXhLKzBZajhIK1FveFRZNVlIakVwNndyV2lXV2ROUFdVMlcwNTZMVGpk?=
 =?utf-8?B?NW1xR0pjNWRPeXlvYmhxNlhNUWFJMjJQT0lsb3VTN2RtSm9XakZwbnQ2OXB2?=
 =?utf-8?B?aWlhbzhURlVoclpvdXNBY0ZyMlJ4eXlpdzNPeTIrellpUk9pNnpuYmw1Umpv?=
 =?utf-8?B?Q2IrVGlOdkZjdEZtT0JLQXlvbFIrQ3ptdVhHRERFaHV1OGoxK2FENjk2cXYy?=
 =?utf-8?B?Qk9ya1ZNcEx2ZVZCMWIzbE9xYWtya1JYOXczaWFidFlBejlnOHhxclRaWXRx?=
 =?utf-8?B?ZVFuMW1JakpCSThVQWlxaGlZUWgrN0R0bjZDVXpSRUlPOThaRU9yckY4WitR?=
 =?utf-8?B?YWFqVFlncndreTU1bXluTHR6azVNSVlUMFkrYkE3Um11Mjg1TFI5M1ltRTNn?=
 =?utf-8?B?YXh2bzVEZVExdFZHWFhhU045ckIwKzdNbmdzMkp6ZFZyb0ltM2EvZz09?=
X-Exchange-RoutingPolicyChecked: D6uLykrH6sXQktWCGs9ZvfE3dFcvksYe8yT1ixgTS2uDNkGHtIIYj/VSoEU02qkuKrvVIUaGEujfzc7qBbfSnXCMp0WAuUvIQYWpZtkljliAanGGHpPuOG15vbc6tSw2dTDIqEyR0ozX0446gTs3/JASJBE6QaU9iFUV2UeztwtFajsGsfPe9Mk30XGBnwYFcFjJlcx1LiVeqDZDhUymslOchJ/r6EmMqGcBefnmX9mUWDCS1/hXgOv0B67/9DzaOvze5nV4TqQx9AUxXLNNV7Zf15bRkv0M5VOCNA6pKVGZzg8Ku3sX6BvaeJUS1FJr0wnbrCNNr4XoO4Qn0g1/TQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mO3QUvQNxer/A8EiFxNzF66JuOZUG3+sV5K++L7+RL98wqNlwys4LniYS+QVU3kOmq9ba5WoafyR9U0mV6Zobplda21j0zcAodCkpJDr1VtfWPrbbd2Y9rOEHuOOTk+SEnL3nnJgEY0wFA73hYTQ/UB44TvvFme20ZBzKwweGiybRuJEYtigljVfAQRHkcwwFcdppT7iY+iRHJxR4AV1zCMtJScXm9vsAhtrRxKjFag3boN7yBG9iSP3itxO42ejeYTl/yiwZG0K4PLnOQ7I8yef1qWolxr2E7zg2h/IO5T8WGaDTUt1vcUHYgK4Irf2O6H1oYs6qZq1O5ksw3TRhT+X9vCG668OWIGbzbXN8Sm++i1AP9REj1UjfMzwCRPRHRHhh6apfzapdRCp3+r7seeHrlGxHR8OabTipVF7LJYfLT35dQmmc7yB4HR/1Vfobt5FAWUTKoFUF6lnMLrwGLH8SWFW7r1kv9/K/aOcHhqDqU0iyxdKXZ164ObRNSXEMApX7cLU4IS7xBgBI44XjnnmX6YBAwC08XUTHGY0iJfviRnLJwgaKNhiUvnhs+2XjPMwmKwg5uh7GHq3mjKNC5PuPAlvKBbD4XdRNg+WD7IHxkKe7vcCSgy1fAkMiEVT
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bef1d38-b754-4b31-e765-08df461ed200
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:23:49.8298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/z47jXK6WXhklwk0KVDPb+Tow0hNdFyI7EnSwqBc0Y1lRowW4ezZ5Q0qKx/3gUgEHTKJKFoxjpu58Xc2WybKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0893
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission: 
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3P192MB0893.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX4qPoNbGi5aDJ
 Zy78vJ217R6OWdX/b/3DCPuXQvCWuNC7kCLSqMf3iufURoxEG7dVRopfTfT2SUNgSWf0JAp+KKX
 lH8xXewd6ijtxMRfK0wTw0B/WF12e8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX6BcBsiP8rC5V
 19G6Io0U1FvQ+tY2UIYzQ8dpJk3tmsZVU7F1a/xDInq6zHPWK6ejg2pIewmkotIboytMT5t7fG0
 XdqpeKSPUBAappqEPVmaAAJl/cj+1qe531P4Y4gzEZE/v/1qe+KcPOyM8oXcF4JI0khN/nk84lL
 Z1JVWSnlYqpuBsNjJbPEMYiV6aOQlVwU1tR1iHyEId/4+Jg6uTmK8QneHe4g2DMHO35GqjAfRwi
 Wv3SkSp3MucxJ+WMkHyF+qMs6a1Bb26Hjb+dLJ/cKs82+ZCMSwTzvK6/amMR6ECEJGJib+GKvsD
 8ZoqOf5zADhUpXV9WlRbomHEDEIhVZZIfVQJA2R+RHO2FawEsTz+2tnhD+L0pYs153vt5WQK5Fq
 5lzrxH+3zd9RQBoER2Ls1UJI7nRFaqFvDe+bZIQKUPNpFe3jk7k6Fha2aj1+h9OheU4Hv2/vcE4
 ZJJCzV5rvE4GX6mqjGQ==
X-Authority-Analysis: v=2.4 cv=T5YZ3PKQ c=1 sm=1 tr=0 ts=6afec028 cx=c_pps
 a=4GbWmdgbNi8q0gmMuSA+Nw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=N9GNhs4bAAAA:8 a=vn4Wnp1iVdA-2sgNeAQA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: xEQXpSj8RHlHXJFkVcdORnmTKYHStCyV
X-Proofpoint-ORIG-GUID: xEQXpSj8RHlHXJFkVcdORnmTKYHStCyV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012406_567476_5789C2D8 
X-CRM114-Status: GOOD (  10.09  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Apart from the copy engine descriptors, all other HAL ring descriptors
(TCL, WBM, REO commands/status, RX buffer/link descriptors, monitor status
TLVs) as well as the ring head/tail pointer shadow locations are accessed
by the hardware in little endian byte order. On big endian hosts the driver
enables the MSI, data TLV and ring pointer swap flags of the SRNG and
relies on the hardware to swap the data.

Remove the big endian SRNG swap flags and handle endianness in the driver
instead. Convert the HAL descriptor structures and ring pointers to __le32
and use cpu_to_le32(), le32_to_cpu(), le32_encode_bits() and
le32_get_bits() for all accesses.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.c  |   2 +-
 drivers/net/wireless/ath/ath11k/hal.c      |  70 +++++------
 drivers/net/wireless/ath/ath11k/hal.h      |   8 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h | 238 ++++++++++++++++++------------------
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 712 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------
 drivers/net/wireless/ath/ath11k/hal_rx.h   |  14 +--
 drivers/net/wireless/ath/ath11k/hal_tx.c   | 106 ++++++++--------
 drivers/net/wireless/ath/ath11k/hw.c       |   9 +-
 8 files changed, 591 insertions(+), 568 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb..74f19ca4c464 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -81,7 +81,7 @@ void ath11k_debugfs_add_dbring_entry(struct ath11k *ar,
 	if (dbr_data->entries) {
 		entry = &dbr_data->entries[dbr_data->dbr_debug_idx];
 		entry->hp = srng->u.src_ring.hp;
-		entry->tp = *srng->u.src_ring.tp_addr;
+		entry->tp = le32_to_cpu(*srng->u.src_ring.tp_addr);
 		entry->timestamp = jiffies;
 		entry->event = event;
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index a25f7bf57c07..7d9f971f0c18 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -609,12 +609,14 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
 void ath11k_hal_set_link_desc_addr(struct hal_wbm_link_desc *desc, u32 cookie,
 				   dma_addr_t paddr)
 {
-	desc->buf_addr_info.info0 = FIELD_PREP(BUFFER_ADDR_INFO0_ADDR,
-					       (paddr & HAL_ADDR_LSB_REG_MASK));
-	desc->buf_addr_info.info1 = FIELD_PREP(BUFFER_ADDR_INFO1_ADDR,
-					       ((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT)) |
-				    FIELD_PREP(BUFFER_ADDR_INFO1_RET_BUF_MGR, 1) |
-				    FIELD_PREP(BUFFER_ADDR_INFO1_SW_COOKIE, cookie);
+	desc->buf_addr_info.info0 = le32_encode_bits((paddr & HAL_ADDR_LSB_REG_MASK),
+						     BUFFER_ADDR_INFO0_ADDR);
+	desc->buf_addr_info.info1 = le32_encode_bits(((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT),
+						     BUFFER_ADDR_INFO1_ADDR) |
+				    le32_encode_bits(1,
+						     BUFFER_ADDR_INFO1_RET_BUF_MGR) |
+				    le32_encode_bits(cookie,
+						     BUFFER_ADDR_INFO1_SW_COOKIE);
 }
 
 u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
@@ -692,7 +694,7 @@ int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 	tp = srng->u.dst_ring.tp;
 
 	if (sync_hw_ptr) {
-		hp = *srng->u.dst_ring.hp_addr;
+		hp = le32_to_cpu(*srng->u.dst_ring.hp_addr);
 		srng->u.dst_ring.cached_hp = hp;
 	} else {
 		hp = srng->u.dst_ring.cached_hp;
@@ -715,7 +717,7 @@ int ath11k_hal_srng_src_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 	hp = srng->u.src_ring.hp;
 
 	if (sync_hw_ptr) {
-		tp = *srng->u.src_ring.tp_addr;
+		tp = le32_to_cpu(*srng->u.src_ring.tp_addr);
 		srng->u.src_ring.cached_tp = tp;
 	} else {
 		tp = srng->u.src_ring.cached_tp;
@@ -830,9 +832,9 @@ void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
 
 	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
 		srng->u.src_ring.cached_tp =
-			*(volatile u32 *)srng->u.src_ring.tp_addr;
+			le32_to_cpu(*(volatile __le32 *)srng->u.src_ring.tp_addr);
 	} else {
-		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
+		hp = le32_to_cpu(READ_ONCE(*srng->u.dst_ring.hp_addr));
 
 		if (hp != srng->u.dst_ring.cached_hp) {
 			srng->u.dst_ring.cached_hp = hp;
@@ -861,24 +863,27 @@ void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng)
 		 */
 		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
 			srng->u.src_ring.last_tp =
-				*(volatile u32 *)srng->u.src_ring.tp_addr;
+				le32_to_cpu(*(volatile __le32 *)srng->u.src_ring.tp_addr);
 			/* Make sure descriptor is written before updating the
 			 * head pointer.
 			 */
 			dma_wmb();
-			WRITE_ONCE(*srng->u.src_ring.hp_addr, srng->u.src_ring.hp);
+			WRITE_ONCE(*srng->u.src_ring.hp_addr,
+				   cpu_to_le32(srng->u.src_ring.hp));
 		} else {
-			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
+			srng->u.dst_ring.last_hp =
+				le32_to_cpu(*srng->u.dst_ring.hp_addr);
 			/* Make sure descriptor is read before updating the
 			 * tail pointer.
 			 */
 			dma_mb();
-			WRITE_ONCE(*srng->u.dst_ring.tp_addr, srng->u.dst_ring.tp);
+			WRITE_ONCE(*srng->u.dst_ring.tp_addr,
+				   cpu_to_le32(srng->u.dst_ring.tp));
 		}
 	} else {
 		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
 			srng->u.src_ring.last_tp =
-				*(volatile u32 *)srng->u.src_ring.tp_addr;
+				le32_to_cpu(*(volatile __le32 *)srng->u.src_ring.tp_addr);
 			/* Assume implementation use an MMIO write accessor
 			 * which has the required wmb() so that the descriptor
 			 * is written before the updating the head pointer.
@@ -888,7 +893,8 @@ void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng)
 					   (unsigned long)ab->mem,
 					   srng->u.src_ring.hp);
 		} else {
-			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
+			srng->u.dst_ring.last_hp =
+				le32_to_cpu(*srng->u.dst_ring.hp_addr);
 			/* Make sure descriptor is read before updating the
 			 * tail pointer.
 			 */
@@ -915,13 +921,11 @@ void ath11k_hal_setup_link_idle_list(struct ath11k_base *ab,
 	link_addr = (void *)sbuf[0].vaddr + HAL_WBM_IDLE_SCATTER_BUF_SIZE;
 
 	for (i = 1; i < nsbufs; i++) {
-		link_addr->info0 = sbuf[i].paddr & HAL_ADDR_LSB_REG_MASK;
-		link_addr->info1 = FIELD_PREP(
-				HAL_WBM_SCATTERED_DESC_MSB_BASE_ADDR_39_32,
-				(u64)sbuf[i].paddr >> HAL_ADDR_MSB_REG_SHIFT) |
-				FIELD_PREP(
-				HAL_WBM_SCATTERED_DESC_MSB_BASE_ADDR_MATCH_TAG,
-				BASE_ADDR_MATCH_TAG_VAL);
+		link_addr->info0 = cpu_to_le32(sbuf[i].paddr & HAL_ADDR_LSB_REG_MASK);
+		link_addr->info1 = le32_encode_bits(((u64)sbuf[i].paddr >> HAL_ADDR_MSB_REG_SHIFT),
+						    HAL_WBM_SCATTERED_DESC_MSB_BASE_ADDR_39_32) |
+				   le32_encode_bits(BASE_ADDR_MATCH_TAG_VAL,
+						    HAL_WBM_SCATTERED_DESC_MSB_BASE_ADDR_MATCH_TAG);
 
 		link_addr = (void *)sbuf[i].vaddr +
 			     HAL_WBM_IDLE_SCATTER_BUF_SIZE;
@@ -1038,11 +1042,6 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
 	memset(srng->ring_base_vaddr, 0,
 	       (srng->entry_size * srng->num_entries) << 2);
 
-	/* TODO: Add comments on these swap configurations */
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
-		srng->flags |= HAL_SRNG_FLAGS_MSI_SWAP | HAL_SRNG_FLAGS_DATA_TLV_SWAP |
-			       HAL_SRNG_FLAGS_RING_PTR_SWAP;
-
 	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R2];
 
 	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
@@ -1060,7 +1059,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
 		} else {
 			if (!ab->hw_params.supports_shadow_regs)
 				srng->u.src_ring.hp_addr =
-				(u32 *)((unsigned long)ab->mem + reg_base);
+				(__le32 *)((unsigned long)ab->mem + reg_base);
 			else
 				ath11k_dbg(ab, ATH11K_DBG_HAL,
 					   "type %d ring_num %d reg_base 0x%x shadow 0x%lx\n",
@@ -1093,7 +1092,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
 		} else {
 			if (!ab->hw_params.supports_shadow_regs)
 				srng->u.dst_ring.tp_addr =
-				(u32 *)((unsigned long)ab->mem + reg_base +
+				(__le32 *)((unsigned long)ab->mem + reg_base +
 					(HAL_REO1_RING_TP(ab) - HAL_REO1_RING_HP(ab)));
 			else
 				ath11k_dbg(ab, ATH11K_DBG_HAL,
@@ -1136,10 +1135,10 @@ static void ath11k_hal_srng_update_hp_tp_addr(struct ath11k_base *ab,
 	srng = &hal->srng_list[ring_id];
 
 	if (srng_config->ring_dir == HAL_SRNG_DIR_DST)
-		srng->u.dst_ring.tp_addr = (u32 *)(HAL_SHADOW_REG(ab, shadow_cfg_idx) +
+		srng->u.dst_ring.tp_addr = (__le32 *)(HAL_SHADOW_REG(ab, shadow_cfg_idx) +
 						   (unsigned long)ab->mem);
 	else
-		srng->u.src_ring.hp_addr = (u32 *)(HAL_SHADOW_REG(ab, shadow_cfg_idx) +
+		srng->u.src_ring.hp_addr = (__le32 *)(HAL_SHADOW_REG(ab, shadow_cfg_idx) +
 						   (unsigned long)ab->mem);
 }
 
@@ -1221,7 +1220,7 @@ void ath11k_hal_srng_shadow_update_hp_tp(struct ath11k_base *ab,
 	 * HP only when then ring isn't empty.
 	 */
 	if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
-	    *srng->u.src_ring.tp_addr != srng->u.src_ring.hp)
+	    le32_to_cpu(*srng->u.src_ring.tp_addr) != srng->u.src_ring.hp)
 		ath11k_hal_srng_access_end(ab, srng);
 }
 
@@ -1447,14 +1446,15 @@ void ath11k_hal_dump_srng_stats(struct ath11k_base *ab)
 				   "src srng id %u hp %u, reap_hp %u, cur tp %u, cached tp %u last tp %u napi processed before %ums\n",
 				   srng->ring_id, srng->u.src_ring.hp,
 				   srng->u.src_ring.reap_hp,
-				   *srng->u.src_ring.tp_addr, srng->u.src_ring.cached_tp,
+				   le32_to_cpu(*srng->u.src_ring.tp_addr),
+				   srng->u.src_ring.cached_tp,
 				   srng->u.src_ring.last_tp,
 				   jiffies_to_msecs(jiffies - srng->timestamp));
 		else if (srng->ring_dir == HAL_SRNG_DIR_DST)
 			ath11k_err(ab,
 				   "dst srng id %u tp %u, cur hp %u, cached hp %u last hp %u napi processed before %ums\n",
 				   srng->ring_id, srng->u.dst_ring.tp,
-				   *srng->u.dst_ring.hp_addr,
+				   le32_to_cpu(*srng->u.dst_ring.hp_addr),
 				   srng->u.dst_ring.cached_hp,
 				   srng->u.dst_ring.last_hp,
 				   jiffies_to_msecs(jiffies - srng->timestamp));
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 82603a389bb9..8a1872fefa8a 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -592,7 +592,7 @@ struct hal_srng {
 			u32 tp;
 
 			/* Shadow head pointer location to be updated by HW */
-			volatile u32 *hp_addr;
+			volatile __le32 *hp_addr;
 
 			/* Cached head pointer */
 			u32 cached_hp;
@@ -601,7 +601,7 @@ struct hal_srng {
 			 * will be a register address and need not be
 			 * accessed through SW structure
 			 */
-			u32 *tp_addr;
+			__le32 *tp_addr;
 
 			/* Current SW loop cnt */
 			u32 loop_cnt;
@@ -621,7 +621,7 @@ struct hal_srng {
 			u32 reap_hp;
 
 			/* Shadow tail pointer location to be updated by HW */
-			u32 *tp_addr;
+			__le32 *tp_addr;
 
 			/* Cached tail pointer */
 			u32 cached_tp;
@@ -630,7 +630,7 @@ struct hal_srng {
 			 * will be a register address and need not be accessed
 			 * through SW structure
 			 */
-			u32 *hp_addr;
+			__le32 *hp_addr;
 
 			/* Low threshold - in number of ring entries */
 			u32 low_threshold;
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 65529451425d..333d1e714914 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -15,8 +15,8 @@
 #define BUFFER_ADDR_INFO1_SW_COOKIE    GENMASK(31, 11)
 
 struct ath11k_buffer_addr {
-	u32 info0;
-	u32 info1;
+	__le32 info0;
+	__le32 info1;
 } __packed;
 
 /* ath11k_buffer_addr
@@ -480,7 +480,7 @@ enum hal_tlv_tag {
 #define HAL_TLV_ALIGN	4
 
 struct hal_tlv_hdr {
-	u32 tl;
+	__le32 tl;
 	u8 value[];
 } __packed;
 
@@ -501,8 +501,8 @@ struct hal_tlv_hdr {
 #define RX_MPDU_DESC_META_DATA_PEER_ID		GENMASK(15, 0)
 
 struct rx_mpdu_desc {
-	u32 info0; /* %RX_MPDU_DESC_INFO */
-	u32 meta_data;
+	__le32 info0; /* %RX_MPDU_DESC_INFO */
+	__le32 meta_data;
 } __packed;
 
 /* rx_mpdu_desc
@@ -587,8 +587,8 @@ enum hal_rx_msdu_desc_reo_dest_ind {
 	(FIELD_GET(RX_MSDU_DESC_INFO0_MSDU_LENGTH, (val)))
 
 struct rx_msdu_desc {
-	u32 info0;
-	u32 rsvd0;
+	__le32 info0;
+	__le32 rsvd0;
 } __packed;
 
 /* rx_msdu_desc
@@ -693,16 +693,16 @@ struct hal_reo_dest_ring {
 	struct ath11k_buffer_addr buf_addr_info;
 	struct rx_mpdu_desc rx_mpdu_info;
 	struct rx_msdu_desc rx_msdu_info;
-	u32 queue_addr_lo;
-	u32 info0; /* %HAL_REO_DEST_RING_INFO0_ */
-	u32 info1; /* %HAL_REO_DEST_RING_INFO1_ */
-	u32 rsvd0;
-	u32 rsvd1;
-	u32 rsvd2;
-	u32 rsvd3;
-	u32 rsvd4;
-	u32 rsvd5;
-	u32 info2; /* %HAL_REO_DEST_RING_INFO2_ */
+	__le32 queue_addr_lo;
+	__le32 info0; /* %HAL_REO_DEST_RING_INFO0_ */
+	__le32 info1; /* %HAL_REO_DEST_RING_INFO1_ */
+	__le32 rsvd0;
+	__le32 rsvd1;
+	__le32 rsvd2;
+	__le32 rsvd3;
+	__le32 rsvd4;
+	__le32 rsvd5;
+	__le32 info2; /* %HAL_REO_DEST_RING_INFO2_ */
 } __packed;
 
 /* hal_reo_dest_ring
@@ -795,10 +795,10 @@ enum hal_reo_entr_rxdma_ecode {
 struct hal_reo_entrance_ring {
 	struct ath11k_buffer_addr buf_addr_info;
 	struct rx_mpdu_desc rx_mpdu_info;
-	u32 queue_addr_lo;
-	u32 info0; /* %HAL_REO_ENTR_RING_INFO0_ */
-	u32 info1; /* %HAL_REO_ENTR_RING_INFO1_ */
-	u32 info2; /* %HAL_REO_DEST_RING_INFO2_ */
+	__le32 queue_addr_lo;
+	__le32 info0; /* %HAL_REO_ENTR_RING_INFO0_ */
+	__le32 info1; /* %HAL_REO_ENTR_RING_INFO1_ */
+	__le32 info2; /* %HAL_REO_DEST_RING_INFO2_ */
 
 } __packed;
 
@@ -875,15 +875,15 @@ struct hal_sw_monitor_ring {
 	struct ath11k_buffer_addr buf_addr_info;
 	struct rx_mpdu_desc rx_mpdu_info;
 	struct ath11k_buffer_addr status_buf_addr_info;
-	u32 info0;
-	u32 info1;
+	__le32 info0;
+	__le32 info1;
 } __packed;
 
 #define HAL_REO_CMD_HDR_INFO0_CMD_NUMBER	GENMASK(15, 0)
 #define HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED	BIT(16)
 
 struct hal_reo_cmd_hdr {
-	u32 info0;
+	__le32 info0;
 } __packed;
 
 #define HAL_REO_GET_QUEUE_STATS_INFO0_QUEUE_ADDR_HI	GENMASK(7, 0)
@@ -891,9 +891,9 @@ struct hal_reo_cmd_hdr {
 
 struct hal_reo_get_queue_stats {
 	struct hal_reo_cmd_hdr cmd;
-	u32 queue_addr_lo;
-	u32 info0;
-	u32 rsvd0[6];
+	__le32 queue_addr_lo;
+	__le32 info0;
+	__le32 rsvd0[6];
 } __packed;
 
 /* hal_reo_get_queue_stats
@@ -933,9 +933,9 @@ struct hal_reo_get_queue_stats {
 
 struct hal_reo_flush_queue {
 	struct hal_reo_cmd_hdr cmd;
-	u32 desc_addr_lo;
-	u32 info0;
-	u32 rsvd0[6];
+	__le32 desc_addr_lo;
+	__le32 info0;
+	__le32 rsvd0[6];
 } __packed;
 
 #define HAL_REO_FLUSH_CACHE_INFO0_CACHE_ADDR_HI		GENMASK(7, 0)
@@ -948,9 +948,9 @@ struct hal_reo_flush_queue {
 
 struct hal_reo_flush_cache {
 	struct hal_reo_cmd_hdr cmd;
-	u32 cache_addr_lo;
-	u32 info0;
-	u32 rsvd0[6];
+	__le32 cache_addr_lo;
+	__le32 info0;
+	__le32 rsvd0[6];
 } __packed;
 
 #define HAL_TCL_DATA_CMD_INFO0_DESC_TYPE	BIT(0)
@@ -1025,11 +1025,11 @@ enum hal_wbm_htt_tx_comp_status {
 
 struct hal_tcl_data_cmd {
 	struct ath11k_buffer_addr buf_addr_info;
-	u32 info0;
-	u32 info1;
-	u32 info2;
-	u32 info3;
-	u32 info4;
+	__le32 info0;
+	__le32 info1;
+	__le32 info2;
+	__le32 info3;
+	__le32 info4;
 } __packed;
 
 /* hal_tcl_data_cmd
@@ -1216,11 +1216,11 @@ enum hal_tcl_gse_ctrl {
 #define HAL_TCL_GSE_CMD_INFO1_LOOPING_COUNT		GENMASK(31, 28)
 
 struct hal_tcl_gse_cmd {
-	u32 ctrl_buf_addr_lo;
-	u32 info0;
-	u32 meta_data[2];
-	u32 rsvd0[2];
-	u32 info1;
+	__le32 ctrl_buf_addr_lo;
+	__le32 info0;
+	__le32 meta_data[2];
+	__le32 rsvd0[2];
+	__le32 info1;
 } __packed;
 
 /* hal_tcl_gse_cmd
@@ -1265,13 +1265,13 @@ enum hal_tcl_cache_op_res {
 #define HAL_TCL_STATUS_RING_INFO2_LOOPING_COUNT		GENMASK(31, 28)
 
 struct hal_tcl_status_ring {
-	u32 info0;
-	u32 msdu_byte_count;
-	u32 msdu_timestamp;
-	u32 meta_data[2];
-	u32 info1;
-	u32 rsvd0;
-	u32 info2;
+	__le32 info0;
+	__le32 msdu_byte_count;
+	__le32 msdu_timestamp;
+	__le32 meta_data[2];
+	__le32 info1;
+	__le32 rsvd0;
+	__le32 info2;
 } __packed;
 
 /* hal_tcl_status_ring
@@ -1558,8 +1558,8 @@ enum hal_tx_rate_stats_sgi {
 };
 
 struct hal_tx_rate_stats {
-	u32 info0;
-	u32 tsf;
+	__le32 info0;
+	__le32 tsf;
 } __packed;
 
 struct hal_wbm_link_desc {
@@ -1667,11 +1667,11 @@ enum hal_wbm_rel_bm_act {
 
 struct hal_wbm_release_ring {
 	struct ath11k_buffer_addr buf_addr_info;
-	u32 info0;
-	u32 info1;
-	u32 info2;
+	__le32 info0;
+	__le32 info1;
+	__le32 info2;
 	struct hal_tx_rate_stats rate_stats;
-	u32 info3;
+	__le32 info3;
 } __packed;
 
 /* hal_wbm_release_ring
@@ -1893,7 +1893,7 @@ enum hal_desc_buf_type {
 #define HAL_DESC_HDR_INFO0_DBG_RESERVED	GENMASK(31, 8)
 
 struct hal_desc_header {
-	u32 info0;
+	__le32 info0;
 } __packed;
 
 struct hal_rx_mpdu_link_ptr {
@@ -1911,14 +1911,14 @@ struct hal_rx_msdu_details {
 struct hal_rx_msdu_link {
 	struct hal_desc_header desc_hdr;
 	struct ath11k_buffer_addr buf_addr_info;
-	u32 info0;
-	u32 pn[4];
+	__le32 info0;
+	__le32 pn[4];
 	struct hal_rx_msdu_details msdu_link[6];
 } __packed;
 
 struct hal_rx_reo_queue_ext {
 	struct hal_desc_header desc_hdr;
-	u32 rsvd;
+	__le32 rsvd;
 	struct hal_rx_mpdu_link_ptr mpdu_link[15];
 } __packed;
 
@@ -1981,23 +1981,23 @@ enum hal_rx_reo_queue_pn_size {
 
 struct hal_rx_reo_queue {
 	struct hal_desc_header desc_hdr;
-	u32 rx_queue_num;
-	u32 info0;
-	u32 info1;
-	u32 pn[4];
-	u32 last_rx_enqueue_timestamp;
-	u32 last_rx_dequeue_timestamp;
-	u32 next_aging_queue[2];
-	u32 prev_aging_queue[2];
-	u32 rx_bitmap[8];
-	u32 info2;
-	u32 info3;
-	u32 info4;
-	u32 processed_mpdus;
-	u32 processed_msdus;
-	u32 processed_total_bytes;
-	u32 info5;
-	u32 rsvd[3];
+	__le32 rx_queue_num;
+	__le32 info0;
+	__le32 info1;
+	__le32 pn[4];
+	__le32 last_rx_enqueue_timestamp;
+	__le32 last_rx_dequeue_timestamp;
+	__le32 next_aging_queue[2];
+	__le32 prev_aging_queue[2];
+	__le32 rx_bitmap[8];
+	__le32 info2;
+	__le32 info3;
+	__le32 info4;
+	__le32 processed_mpdus;
+	__le32 processed_msdus;
+	__le32 processed_total_bytes;
+	__le32 info5;
+	__le32 rsvd[3];
 	struct hal_rx_reo_queue_ext ext_desc[];
 } __packed;
 
@@ -2118,11 +2118,11 @@ struct hal_rx_reo_queue {
 
 struct hal_reo_update_rx_queue {
 	struct hal_reo_cmd_hdr cmd;
-	u32 queue_addr_lo;
-	u32 info0;
-	u32 info1;
-	u32 info2;
-	u32 pn[4];
+	__le32 queue_addr_lo;
+	__le32 info0;
+	__le32 info1;
+	__le32 info2;
+	__le32 pn[4];
 } __packed;
 
 #define HAL_REO_UNBLOCK_CACHE_INFO0_UNBLK_CACHE		BIT(0)
@@ -2130,8 +2130,8 @@ struct hal_reo_update_rx_queue {
 
 struct hal_reo_unblock_cache {
 	struct hal_reo_cmd_hdr cmd;
-	u32 info0;
-	u32 rsvd[7];
+	__le32 info0;
+	__le32 rsvd[7];
 } __packed;
 
 enum hal_reo_exec_status {
@@ -2146,8 +2146,8 @@ enum hal_reo_exec_status {
 #define HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS	GENMASK(27, 26)
 
 struct hal_reo_status_hdr {
-	u32 info0;
-	u32 timestamp;
+	__le32 info0;
+	__le32 timestamp;
 } __packed;
 
 /* hal_reo_status_hdr
@@ -2189,19 +2189,19 @@ struct hal_reo_status_hdr {
 
 struct hal_reo_get_queue_stats_status {
 	struct hal_reo_status_hdr hdr;
-	u32 info0;
-	u32 pn[4];
-	u32 last_rx_enqueue_timestamp;
-	u32 last_rx_dequeue_timestamp;
-	u32 rx_bitmap[8];
-	u32 info1;
-	u32 info2;
-	u32 info3;
-	u32 num_mpdu_frames;
-	u32 num_msdu_frames;
-	u32 total_bytes;
-	u32 info4;
-	u32 info5;
+	__le32 info0;
+	__le32 pn[4];
+	__le32 last_rx_enqueue_timestamp;
+	__le32 last_rx_dequeue_timestamp;
+	__le32 rx_bitmap[8];
+	__le32 info1;
+	__le32 info2;
+	__le32 info3;
+	__le32 num_mpdu_frames;
+	__le32 num_msdu_frames;
+	__le32 total_bytes;
+	__le32 info4;
+	__le32 info5;
 } __packed;
 
 /* hal_reo_get_queue_stats_status
@@ -2284,9 +2284,9 @@ struct hal_reo_get_queue_stats_status {
 
 struct hal_reo_flush_queue_status {
 	struct hal_reo_status_hdr hdr;
-	u32 info0;
-	u32 rsvd0[21];
-	u32 info1;
+	__le32 info0;
+	__le32 rsvd0[21];
+	__le32 info1;
 } __packed;
 
 /* hal_reo_flush_queue_status
@@ -2319,9 +2319,9 @@ struct hal_reo_flush_queue_status {
 
 struct hal_reo_flush_cache_status {
 	struct hal_reo_status_hdr hdr;
-	u32 info0;
-	u32 rsvd0[21];
-	u32 info1;
+	__le32 info0;
+	__le32 rsvd0[21];
+	__le32 info1;
 } __packed;
 
 /* hal_reo_flush_cache_status
@@ -2381,9 +2381,9 @@ struct hal_reo_flush_cache_status {
 
 struct hal_reo_unblock_cache_status {
 	struct hal_reo_status_hdr hdr;
-	u32 info0;
-	u32 rsvd0[21];
-	u32 info1;
+	__le32 info0;
+	__le32 rsvd0[21];
+	__le32 info1;
 } __packed;
 
 /* hal_reo_unblock_cache_status
@@ -2417,10 +2417,10 @@ struct hal_reo_unblock_cache_status {
 
 struct hal_reo_flush_timeout_list_status {
 	struct hal_reo_status_hdr hdr;
-	u32 info0;
-	u32 info1;
-	u32 rsvd0[20];
-	u32 info2;
+	__le32 info0;
+	__le32 info1;
+	__le32 rsvd0[20];
+	__le32 info2;
 } __packed;
 
 /* hal_reo_flush_timeout_list_status
@@ -2460,13 +2460,13 @@ struct hal_reo_flush_timeout_list_status {
 
 struct hal_reo_desc_thresh_reached_status {
 	struct hal_reo_status_hdr hdr;
-	u32 info0;
-	u32 info1;
-	u32 info2;
-	u32 info3;
-	u32 info4;
-	u32 rsvd0[17];
-	u32 info5;
+	__le32 info0;
+	__le32 info1;
+	__le32 info2;
+	__le32 info3;
+	__le32 info4;
+	__le32 rsvd0[17];
+	__le32 info5;
 } __packed;
 
 /* hal_reo_desc_thresh_reached_status
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 75f7b8d8a0d7..2d8b9a175ed7 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -14,11 +14,11 @@
 static void ath11k_hal_reo_set_desc_hdr(struct hal_desc_header *hdr,
 					u8 owner, u8 buffer_type, u32 magic)
 {
-	hdr->info0 = FIELD_PREP(HAL_DESC_HDR_INFO0_OWNER, owner) |
-		     FIELD_PREP(HAL_DESC_HDR_INFO0_BUF_TYPE, buffer_type);
+	hdr->info0 = le32_encode_bits(owner, HAL_DESC_HDR_INFO0_OWNER) |
+		     le32_encode_bits(buffer_type, HAL_DESC_HDR_INFO0_BUF_TYPE);
 
 	/* Magic pattern in reserved bits for debugging */
-	hdr->info0 |= FIELD_PREP(HAL_DESC_HDR_INFO0_DBG_RESERVED, magic);
+	hdr->info0 |= le32_encode_bits(magic, HAL_DESC_HDR_INFO0_DBG_RESERVED);
 }
 
 static int ath11k_hal_reo_cmd_queue_stats(struct hal_tlv_hdr *tlv,
@@ -26,23 +26,23 @@ static int ath11k_hal_reo_cmd_queue_stats(struct hal_tlv_hdr *tlv,
 {
 	struct hal_reo_get_queue_stats *desc;
 
-	tlv->tl = FIELD_PREP(HAL_TLV_HDR_TAG, HAL_REO_GET_QUEUE_STATS) |
-		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
+	tlv->tl = le32_encode_bits(HAL_REO_GET_QUEUE_STATS, HAL_TLV_HDR_TAG) |
+		  le32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_get_queue_stats *)tlv->value;
 	memset_startat(desc, 0, queue_addr_lo);
 
-	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
+	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
-		desc->cmd.info0 |= HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
+		desc->cmd.info0 |= cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 
-	desc->queue_addr_lo = cmd->addr_lo;
-	desc->info0 = FIELD_PREP(HAL_REO_GET_QUEUE_STATS_INFO0_QUEUE_ADDR_HI,
-				 cmd->addr_hi);
+	desc->queue_addr_lo = cpu_to_le32(cmd->addr_lo);
+	desc->info0 = le32_encode_bits(cmd->addr_hi,
+				       HAL_REO_GET_QUEUE_STATS_INFO0_QUEUE_ADDR_HI);
 	if (cmd->flag & HAL_REO_CMD_FLG_STATS_CLEAR)
-		desc->info0 |= HAL_REO_GET_QUEUE_STATS_INFO0_CLEAR_STATS;
+		desc->info0 |= cpu_to_le32(HAL_REO_GET_QUEUE_STATS_INFO0_CLEAR_STATS);
 
-	return FIELD_GET(HAL_REO_CMD_HDR_INFO0_CMD_NUMBER, desc->cmd.info0);
+	return le32_get_bits(desc->cmd.info0, HAL_REO_CMD_HDR_INFO0_CMD_NUMBER);
 }
 
 static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, struct hal_tlv_hdr *tlv,
@@ -58,37 +58,37 @@ static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, struct hal_tlv
 		hal->current_blk_index = avail_slot;
 	}
 
-	tlv->tl = FIELD_PREP(HAL_TLV_HDR_TAG, HAL_REO_FLUSH_CACHE) |
-		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
+	tlv->tl = le32_encode_bits(HAL_REO_FLUSH_CACHE, HAL_TLV_HDR_TAG) |
+		  le32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_flush_cache *)tlv->value;
 	memset_startat(desc, 0, cache_addr_lo);
 
-	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
+	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
-		desc->cmd.info0 |= HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
+		desc->cmd.info0 |= cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 
-	desc->cache_addr_lo = cmd->addr_lo;
-	desc->info0 = FIELD_PREP(HAL_REO_FLUSH_CACHE_INFO0_CACHE_ADDR_HI,
-				 cmd->addr_hi);
+	desc->cache_addr_lo = cpu_to_le32(cmd->addr_lo);
+	desc->info0 = le32_encode_bits(cmd->addr_hi,
+				       HAL_REO_FLUSH_CACHE_INFO0_CACHE_ADDR_HI);
 
 	if (cmd->flag & HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS)
-		desc->info0 |= HAL_REO_FLUSH_CACHE_INFO0_FWD_ALL_MPDUS;
+		desc->info0 |= cpu_to_le32(HAL_REO_FLUSH_CACHE_INFO0_FWD_ALL_MPDUS);
 
 	if (cmd->flag & HAL_REO_CMD_FLG_FLUSH_BLOCK_LATER) {
-		desc->info0 |= HAL_REO_FLUSH_CACHE_INFO0_BLOCK_CACHE_USAGE;
+		desc->info0 |= cpu_to_le32(HAL_REO_FLUSH_CACHE_INFO0_BLOCK_CACHE_USAGE);
 		desc->info0 |=
-			FIELD_PREP(HAL_REO_FLUSH_CACHE_INFO0_BLOCK_RESRC_IDX,
-				   avail_slot);
+			le32_encode_bits(avail_slot,
+					 HAL_REO_FLUSH_CACHE_INFO0_BLOCK_RESRC_IDX);
 	}
 
 	if (cmd->flag & HAL_REO_CMD_FLG_FLUSH_NO_INVAL)
-		desc->info0 |= HAL_REO_FLUSH_CACHE_INFO0_FLUSH_WO_INVALIDATE;
+		desc->info0 |= cpu_to_le32(HAL_REO_FLUSH_CACHE_INFO0_FLUSH_WO_INVALIDATE);
 
 	if (cmd->flag & HAL_REO_CMD_FLG_FLUSH_ALL)
-		desc->info0 |= HAL_REO_FLUSH_CACHE_INFO0_FLUSH_ALL;
+		desc->info0 |= cpu_to_le32(HAL_REO_FLUSH_CACHE_INFO0_FLUSH_ALL);
 
-	return FIELD_GET(HAL_REO_CMD_HDR_INFO0_CMD_NUMBER, desc->cmd.info0);
+	return le32_get_bits(desc->cmd.info0, HAL_REO_CMD_HDR_INFO0_CMD_NUMBER);
 }
 
 static int ath11k_hal_reo_cmd_update_rx_queue(struct hal_tlv_hdr *tlv,
@@ -96,96 +96,97 @@ static int ath11k_hal_reo_cmd_update_rx_queue(struct hal_tlv_hdr *tlv,
 {
 	struct hal_reo_update_rx_queue *desc;
 
-	tlv->tl = FIELD_PREP(HAL_TLV_HDR_TAG, HAL_REO_UPDATE_RX_REO_QUEUE) |
-		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
+	tlv->tl = le32_encode_bits(HAL_REO_UPDATE_RX_REO_QUEUE,
+				   HAL_TLV_HDR_TAG) |
+		  le32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_update_rx_queue *)tlv->value;
 	memset_startat(desc, 0, queue_addr_lo);
 
-	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
+	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
-		desc->cmd.info0 |= HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
+		desc->cmd.info0 |= cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 
-	desc->queue_addr_lo = cmd->addr_lo;
+	desc->queue_addr_lo = cpu_to_le32(cmd->addr_lo);
 	desc->info0 =
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_QUEUE_ADDR_HI,
-			   cmd->addr_hi) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_RX_QUEUE_NUM,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_RX_QUEUE_NUM)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_VLD,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_VLD)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_ASSOC_LNK_DESC_CNT,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_ALDC)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_DIS_DUP_DETECTION,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_DIS_DUP_DETECTION)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_SOFT_REORDER_EN,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_SOFT_REORDER_EN)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_AC,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_AC)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_BAR,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_BAR)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_RETRY,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_RETRY)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_CHECK_2K_MODE,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_CHECK_2K_MODE)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_OOR_MODE,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_OOR_MODE)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_BA_WINDOW_SIZE,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_BA_WINDOW_SIZE)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN_CHECK,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_PN_CHECK)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_EVEN_PN,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_EVEN_PN)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_UNEVEN_PN,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_UNEVEN_PN)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN_HANDLE_ENABLE,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_PN_HANDLE_ENABLE)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN_SIZE,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_PN_SIZE)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_IGNORE_AMPDU_FLG,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_IGNORE_AMPDU_FLG)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_SVLD,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_SVLD)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_SSN,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_SSN)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_SEQ_2K_ERR,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_SEQ_2K_ERR)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN_VALID,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_PN_VALID)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN,
-			   !!(cmd->upd0 & HAL_REO_CMD_UPD0_PN));
+		le32_encode_bits(cmd->addr_hi,
+				 HAL_REO_UPD_RX_QUEUE_INFO0_QUEUE_ADDR_HI) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_RX_QUEUE_NUM),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_RX_QUEUE_NUM) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_VLD),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_VLD) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_ALDC),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_ASSOC_LNK_DESC_CNT) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_DIS_DUP_DETECTION),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_DIS_DUP_DETECTION) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_SOFT_REORDER_EN),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_SOFT_REORDER_EN) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_AC),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_AC) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_BAR),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_BAR) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_RETRY),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_RETRY) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_CHECK_2K_MODE),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_CHECK_2K_MODE) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_OOR_MODE),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_OOR_MODE) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_BA_WINDOW_SIZE),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_BA_WINDOW_SIZE) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_PN_CHECK),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN_CHECK) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_EVEN_PN),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_EVEN_PN) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_UNEVEN_PN),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_UNEVEN_PN) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_PN_HANDLE_ENABLE),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN_HANDLE_ENABLE) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_PN_SIZE),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN_SIZE) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_IGNORE_AMPDU_FLG),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_IGNORE_AMPDU_FLG) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_SVLD),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_SVLD) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_SSN),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_SSN) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_SEQ_2K_ERR),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_SEQ_2K_ERR) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_PN_VALID),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN_VALID) |
+		le32_encode_bits(!!(cmd->upd0 & HAL_REO_CMD_UPD0_PN),
+				 HAL_REO_UPD_RX_QUEUE_INFO0_UPD_PN);
 
 	desc->info1 =
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_RX_QUEUE_NUMBER,
-			   cmd->rx_queue_num) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_VLD,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_VLD)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_ASSOC_LNK_DESC_COUNTER,
-			   FIELD_GET(HAL_REO_CMD_UPD1_ALDC, cmd->upd1)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_DIS_DUP_DETECTION,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_DIS_DUP_DETECTION)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_SOFT_REORDER_EN,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_SOFT_REORDER_EN)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_AC,
-			   FIELD_GET(HAL_REO_CMD_UPD1_AC, cmd->upd1)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_BAR,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_BAR)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_CHECK_2K_MODE,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_CHECK_2K_MODE)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_RETRY,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_RETRY)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_OOR_MODE,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_OOR_MODE)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_PN_CHECK,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_PN_CHECK)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_EVEN_PN,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_EVEN_PN)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_UNEVEN_PN,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_UNEVEN_PN)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_PN_HANDLE_ENABLE,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_PN_HANDLE_ENABLE)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO1_IGNORE_AMPDU_FLG,
-			   !!(cmd->upd1 & HAL_REO_CMD_UPD1_IGNORE_AMPDU_FLG));
+		le32_encode_bits(cmd->rx_queue_num,
+				 HAL_REO_UPD_RX_QUEUE_INFO1_RX_QUEUE_NUMBER) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_VLD),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_VLD) |
+		le32_encode_bits(FIELD_GET(HAL_REO_CMD_UPD1_ALDC, cmd->upd1),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_ASSOC_LNK_DESC_COUNTER) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_DIS_DUP_DETECTION),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_DIS_DUP_DETECTION) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_SOFT_REORDER_EN),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_SOFT_REORDER_EN) |
+		le32_encode_bits(FIELD_GET(HAL_REO_CMD_UPD1_AC,
+					   cmd->upd1), HAL_REO_UPD_RX_QUEUE_INFO1_AC) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_BAR),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_BAR) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_CHECK_2K_MODE),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_CHECK_2K_MODE) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_RETRY),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_RETRY) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_OOR_MODE),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_OOR_MODE) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_PN_CHECK),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_PN_CHECK) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_EVEN_PN),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_EVEN_PN) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_UNEVEN_PN),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_UNEVEN_PN) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_PN_HANDLE_ENABLE),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_PN_HANDLE_ENABLE) |
+		le32_encode_bits(!!(cmd->upd1 & HAL_REO_CMD_UPD1_IGNORE_AMPDU_FLG),
+				 HAL_REO_UPD_RX_QUEUE_INFO1_IGNORE_AMPDU_FLG);
 
 	if (cmd->pn_size == 24)
 		cmd->pn_size = HAL_RX_REO_QUEUE_PN_SIZE_24;
@@ -201,19 +202,20 @@ static int ath11k_hal_reo_cmd_update_rx_queue(struct hal_tlv_hdr *tlv,
 		cmd->ba_window_size++;
 
 	desc->info2 =
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO2_BA_WINDOW_SIZE,
-			   cmd->ba_window_size - 1) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO2_PN_SIZE, cmd->pn_size) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO2_SVLD,
-			   !!(cmd->upd2 & HAL_REO_CMD_UPD2_SVLD)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO2_SSN,
-			   FIELD_GET(HAL_REO_CMD_UPD2_SSN, cmd->upd2)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO2_SEQ_2K_ERR,
-			   !!(cmd->upd2 & HAL_REO_CMD_UPD2_SEQ_2K_ERR)) |
-		FIELD_PREP(HAL_REO_UPD_RX_QUEUE_INFO2_PN_ERR,
-			   !!(cmd->upd2 & HAL_REO_CMD_UPD2_PN_ERR));
-
-	return FIELD_GET(HAL_REO_CMD_HDR_INFO0_CMD_NUMBER, desc->cmd.info0);
+		le32_encode_bits(cmd->ba_window_size - 1,
+				 HAL_REO_UPD_RX_QUEUE_INFO2_BA_WINDOW_SIZE) |
+		le32_encode_bits(cmd->pn_size,
+				 HAL_REO_UPD_RX_QUEUE_INFO2_PN_SIZE) |
+		le32_encode_bits(!!(cmd->upd2 & HAL_REO_CMD_UPD2_SVLD),
+				 HAL_REO_UPD_RX_QUEUE_INFO2_SVLD) |
+		le32_encode_bits(FIELD_GET(HAL_REO_CMD_UPD2_SSN,
+					   cmd->upd2), HAL_REO_UPD_RX_QUEUE_INFO2_SSN) |
+		le32_encode_bits(!!(cmd->upd2 & HAL_REO_CMD_UPD2_SEQ_2K_ERR),
+				 HAL_REO_UPD_RX_QUEUE_INFO2_SEQ_2K_ERR) |
+		le32_encode_bits(!!(cmd->upd2 & HAL_REO_CMD_UPD2_PN_ERR),
+				 HAL_REO_UPD_RX_QUEUE_INFO2_PN_ERR);
+
+	return le32_get_bits(desc->cmd.info0, HAL_REO_CMD_HDR_INFO0_CMD_NUMBER);
 }
 
 int ath11k_hal_reo_cmd_send(struct ath11k_base *ab, struct hal_srng *srng,
@@ -271,10 +273,10 @@ void ath11k_hal_rx_buf_addr_info_set(void *desc, dma_addr_t paddr,
 
 	paddr_lo = lower_32_bits(paddr);
 	paddr_hi = upper_32_bits(paddr);
-	binfo->info0 = FIELD_PREP(BUFFER_ADDR_INFO0_ADDR, paddr_lo);
-	binfo->info1 = FIELD_PREP(BUFFER_ADDR_INFO1_ADDR, paddr_hi) |
-		       FIELD_PREP(BUFFER_ADDR_INFO1_SW_COOKIE, cookie) |
-		       FIELD_PREP(BUFFER_ADDR_INFO1_RET_BUF_MGR, manager);
+	binfo->info0 = le32_encode_bits(paddr_lo, BUFFER_ADDR_INFO0_ADDR);
+	binfo->info1 = le32_encode_bits(paddr_hi, BUFFER_ADDR_INFO1_ADDR) |
+		       le32_encode_bits(cookie, BUFFER_ADDR_INFO1_SW_COOKIE) |
+		       le32_encode_bits(manager, BUFFER_ADDR_INFO1_RET_BUF_MGR);
 }
 
 void ath11k_hal_rx_buf_addr_info_get(void *desc, dma_addr_t *paddr,
@@ -283,10 +285,11 @@ void ath11k_hal_rx_buf_addr_info_get(void *desc, dma_addr_t *paddr,
 	struct ath11k_buffer_addr *binfo = desc;
 
 	*paddr =
-		(((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR, binfo->info1)) << 32) |
-		FIELD_GET(BUFFER_ADDR_INFO0_ADDR, binfo->info0);
-	*cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE, binfo->info1);
-	*rbm = FIELD_GET(BUFFER_ADDR_INFO1_RET_BUF_MGR, binfo->info1);
+		(((u64)le32_get_bits(binfo->info1,
+		 BUFFER_ADDR_INFO1_ADDR)) << 32) |
+		le32_get_bits(binfo->info0, BUFFER_ADDR_INFO0_ADDR);
+	*cookie = le32_get_bits(binfo->info1, BUFFER_ADDR_INFO1_SW_COOKIE);
+	*rbm = le32_get_bits(binfo->info1, BUFFER_ADDR_INFO1_RET_BUF_MGR);
 }
 
 void ath11k_hal_rx_msdu_link_info_get(void *link_desc, u32 *num_msdus,
@@ -300,19 +303,19 @@ void ath11k_hal_rx_msdu_link_info_get(void *link_desc, u32 *num_msdus,
 	*num_msdus = HAL_NUM_RX_MSDUS_PER_LINK_DESC;
 
 	msdu = &link->msdu_link[0];
-	*rbm = FIELD_GET(BUFFER_ADDR_INFO1_RET_BUF_MGR,
-			 msdu->buf_addr_info.info1);
+	*rbm = le32_get_bits(msdu->buf_addr_info.info1,
+			     BUFFER_ADDR_INFO1_RET_BUF_MGR);
 
 	for (i = 0; i < *num_msdus; i++) {
 		msdu = &link->msdu_link[i];
 
-		if (!FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
-			       msdu->buf_addr_info.info0)) {
+		if (!le32_get_bits(msdu->buf_addr_info.info0,
+				   BUFFER_ADDR_INFO0_ADDR)) {
 			*num_msdus = i;
 			break;
 		}
-		*msdu_cookies = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-					  msdu->buf_addr_info.info1);
+		*msdu_cookies = le32_get_bits(msdu->buf_addr_info.info1,
+					      BUFFER_ADDR_INFO1_SW_COOKIE);
 		msdu_cookies++;
 	}
 }
@@ -324,10 +327,10 @@ int ath11k_hal_desc_reo_parse_err(struct ath11k_base *ab, u32 *rx_desc,
 	enum hal_reo_dest_ring_push_reason push_reason;
 	enum hal_reo_dest_ring_error_code err_code;
 
-	push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
-				desc->info0);
-	err_code = FIELD_GET(HAL_REO_DEST_RING_INFO0_ERROR_CODE,
-			     desc->info0);
+	push_reason = le32_get_bits(desc->info0,
+				    HAL_REO_DEST_RING_INFO0_PUSH_REASON);
+	err_code = le32_get_bits(desc->info0,
+				 HAL_REO_DEST_RING_INFO0_ERROR_CODE);
 	ab->soc_stats.reo_error[err_code]++;
 
 	if (push_reason != HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED &&
@@ -337,7 +340,7 @@ int ath11k_hal_desc_reo_parse_err(struct ath11k_base *ab, u32 *rx_desc,
 		return -EINVAL;
 	}
 
-	if (FIELD_GET(HAL_REO_DEST_RING_INFO0_BUFFER_TYPE, desc->info0) !=
+	if (le32_get_bits(desc->info0, HAL_REO_DEST_RING_INFO0_BUFFER_TYPE) !=
 	    HAL_REO_DEST_RING_BUFFER_TYPE_LINK_DESC) {
 		ath11k_warn(ab, "expected buffer type link_desc");
 		return -EINVAL;
@@ -356,51 +359,50 @@ int ath11k_hal_wbm_desc_parse_err(struct ath11k_base *ab, void *desc,
 	enum hal_wbm_rel_src_module rel_src;
 	enum hal_rx_buf_return_buf_manager ret_buf_mgr;
 
-	type = FIELD_GET(HAL_WBM_RELEASE_INFO0_DESC_TYPE,
-			 wbm_desc->info0);
+	type = le32_get_bits(wbm_desc->info0, HAL_WBM_RELEASE_INFO0_DESC_TYPE);
 	/* We expect only WBM_REL buffer type */
 	if (type != HAL_WBM_REL_DESC_TYPE_REL_MSDU) {
 		WARN_ON(1);
 		return -EINVAL;
 	}
 
-	rel_src = FIELD_GET(HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE,
-			    wbm_desc->info0);
+	rel_src = le32_get_bits(wbm_desc->info0,
+				HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
 	if (rel_src != HAL_WBM_REL_SRC_MODULE_RXDMA &&
 	    rel_src != HAL_WBM_REL_SRC_MODULE_REO)
 		return -EINVAL;
 
-	ret_buf_mgr = FIELD_GET(BUFFER_ADDR_INFO1_RET_BUF_MGR,
-				wbm_desc->buf_addr_info.info1);
+	ret_buf_mgr = le32_get_bits(wbm_desc->buf_addr_info.info1,
+				    BUFFER_ADDR_INFO1_RET_BUF_MGR);
 	if (ret_buf_mgr != HAL_RX_BUF_RBM_SW1_BM &&
 	    ret_buf_mgr != HAL_RX_BUF_RBM_SW3_BM) {
 		ab->soc_stats.invalid_rbm++;
 		return -EINVAL;
 	}
 
-	rel_info->cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-				     wbm_desc->buf_addr_info.info1);
+	rel_info->cookie = le32_get_bits(wbm_desc->buf_addr_info.info1,
+					 BUFFER_ADDR_INFO1_SW_COOKIE);
 	rel_info->err_rel_src = rel_src;
 	if (rel_src == HAL_WBM_REL_SRC_MODULE_REO) {
 		rel_info->push_reason =
-			FIELD_GET(HAL_WBM_RELEASE_INFO0_REO_PUSH_REASON,
-				  wbm_desc->info0);
+			le32_get_bits(wbm_desc->info0,
+				      HAL_WBM_RELEASE_INFO0_REO_PUSH_REASON);
 		rel_info->err_code =
-			FIELD_GET(HAL_WBM_RELEASE_INFO0_REO_ERROR_CODE,
-				  wbm_desc->info0);
+			le32_get_bits(wbm_desc->info0,
+				      HAL_WBM_RELEASE_INFO0_REO_ERROR_CODE);
 	} else {
 		rel_info->push_reason =
-			FIELD_GET(HAL_WBM_RELEASE_INFO0_RXDMA_PUSH_REASON,
-				  wbm_desc->info0);
+			le32_get_bits(wbm_desc->info0,
+				      HAL_WBM_RELEASE_INFO0_RXDMA_PUSH_REASON);
 		rel_info->err_code =
-			FIELD_GET(HAL_WBM_RELEASE_INFO0_RXDMA_ERROR_CODE,
-				  wbm_desc->info0);
+			le32_get_bits(wbm_desc->info0,
+				      HAL_WBM_RELEASE_INFO0_RXDMA_ERROR_CODE);
 	}
 
-	rel_info->first_msdu = FIELD_GET(HAL_WBM_RELEASE_INFO2_FIRST_MSDU,
-					 wbm_desc->info2);
-	rel_info->last_msdu = FIELD_GET(HAL_WBM_RELEASE_INFO2_LAST_MSDU,
-					wbm_desc->info2);
+	rel_info->first_msdu = le32_get_bits(wbm_desc->info2,
+					     HAL_WBM_RELEASE_INFO2_FIRST_MSDU);
+	rel_info->last_msdu = le32_get_bits(wbm_desc->info2,
+					    HAL_WBM_RELEASE_INFO2_LAST_MSDU);
 	return 0;
 }
 
@@ -409,10 +411,12 @@ void ath11k_hal_rx_reo_ent_paddr_get(struct ath11k_base *ab, void *desc,
 {
 	struct ath11k_buffer_addr *buff_addr = desc;
 
-	*paddr = ((u64)(FIELD_GET(BUFFER_ADDR_INFO1_ADDR, buff_addr->info1)) << 32) |
-		  FIELD_GET(BUFFER_ADDR_INFO0_ADDR, buff_addr->info0);
+	*paddr = ((u64)(le32_get_bits(buff_addr->info1,
+		  BUFFER_ADDR_INFO1_ADDR)) << 32) |
+		  le32_get_bits(buff_addr->info0, BUFFER_ADDR_INFO0_ADDR);
 
-	*desc_bank = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE, buff_addr->info1);
+	*desc_bank = le32_get_bits(buff_addr->info1,
+				   BUFFER_ADDR_INFO1_SW_COOKIE);
 }
 
 void ath11k_hal_rx_msdu_link_desc_set(struct ath11k_base *ab, void *desc,
@@ -423,11 +427,12 @@ void ath11k_hal_rx_msdu_link_desc_set(struct ath11k_base *ab, void *desc,
 	struct hal_wbm_release_ring *src_desc = link_desc;
 
 	dst_desc->buf_addr_info = src_desc->buf_addr_info;
-	dst_desc->info0 |= FIELD_PREP(HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE,
-				      HAL_WBM_REL_SRC_MODULE_SW) |
-			   FIELD_PREP(HAL_WBM_RELEASE_INFO0_BM_ACTION, action) |
-			   FIELD_PREP(HAL_WBM_RELEASE_INFO0_DESC_TYPE,
-				      HAL_WBM_REL_DESC_TYPE_MSDU_LINK);
+	dst_desc->info0 |= le32_encode_bits(HAL_WBM_REL_SRC_MODULE_SW,
+				     HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE) |
+			   le32_encode_bits(action,
+					    HAL_WBM_RELEASE_INFO0_BM_ACTION) |
+			   le32_encode_bits(HAL_WBM_REL_DESC_TYPE_MSDU_LINK,
+					    HAL_WBM_RELEASE_INFO0_DESC_TYPE);
 }
 
 void ath11k_hal_reo_status_queue_stats(struct ath11k_base *ab, u32 *reo_desc,
@@ -438,21 +443,21 @@ void ath11k_hal_reo_status_queue_stats(struct ath11k_base *ab, u32 *reo_desc,
 		(struct hal_reo_get_queue_stats_status *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_STATUS_NUM,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
 	status->uniform_hdr.cmd_status =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
 
 	ath11k_dbg(ab, ATH11K_DBG_HAL, "Queue stats status:\n");
 	ath11k_dbg(ab, ATH11K_DBG_HAL, "header: cmd_num %d status %d\n",
 		   status->uniform_hdr.cmd_num,
 		   status->uniform_hdr.cmd_status);
-	ath11k_dbg(ab, ATH11K_DBG_HAL, "ssn %ld cur_idx %ld\n",
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO0_SSN,
-			     desc->info0),
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO0_CUR_IDX,
-			     desc->info0));
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "ssn %u cur_idx %u\n",
+		   le32_get_bits(desc->info0,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO0_SSN),
+		   le32_get_bits(desc->info0,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO0_CUR_IDX));
 	ath11k_dbg(ab, ATH11K_DBG_HAL, "pn = [%08x, %08x, %08x, %08x]\n",
 		   desc->pn[0], desc->pn[1], desc->pn[2], desc->pn[3]);
 	ath11k_dbg(ab, ATH11K_DBG_HAL,
@@ -464,36 +469,39 @@ void ath11k_hal_reo_status_queue_stats(struct ath11k_base *ab, u32 *reo_desc,
 		   desc->rx_bitmap[0], desc->rx_bitmap[1], desc->rx_bitmap[2],
 		   desc->rx_bitmap[3], desc->rx_bitmap[4], desc->rx_bitmap[5],
 		   desc->rx_bitmap[6], desc->rx_bitmap[7]);
-	ath11k_dbg(ab, ATH11K_DBG_HAL, "count: cur_mpdu %ld cur_msdu %ld\n",
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO1_MPDU_COUNT,
-			     desc->info1),
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO1_MSDU_COUNT,
-			     desc->info1));
-	ath11k_dbg(ab, ATH11K_DBG_HAL, "fwd_timeout %ld fwd_bar %ld dup_count %ld\n",
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_TIMEOUT_COUNT,
-			     desc->info2),
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_FDTB_COUNT,
-			     desc->info2),
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_DUPLICATE_COUNT,
-			     desc->info2));
-	ath11k_dbg(ab, ATH11K_DBG_HAL, "frames_in_order %ld bar_rcvd %ld\n",
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO3_FIO_COUNT,
-			     desc->info3),
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO3_BAR_RCVD_CNT,
-			     desc->info3));
-	ath11k_dbg(ab, ATH11K_DBG_HAL, "num_mpdus %d num_msdus %d total_bytes %d\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "count: cur_mpdu %u cur_msdu %u\n",
+		   le32_get_bits(desc->info1,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO1_MPDU_COUNT),
+		   le32_get_bits(desc->info1,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO1_MSDU_COUNT));
+	ath11k_dbg(ab, ATH11K_DBG_HAL,
+		   "fwd_timeout %u fwd_bar %u dup_count %u\n",
+		   le32_get_bits(desc->info2,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_TIMEOUT_COUNT),
+		   le32_get_bits(desc->info2,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_FDTB_COUNT),
+		   le32_get_bits(desc->info2,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_DUPLICATE_COUNT));
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "frames_in_order %u bar_rcvd %u\n",
+		   le32_get_bits(desc->info3,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO3_FIO_COUNT),
+		   le32_get_bits(desc->info3,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO3_BAR_RCVD_CNT));
+	ath11k_dbg(ab, ATH11K_DBG_HAL,
+		   "num_mpdus %d num_msdus %d total_bytes %d\n",
 		   desc->num_mpdu_frames, desc->num_msdu_frames,
 		   desc->total_bytes);
-	ath11k_dbg(ab, ATH11K_DBG_HAL, "late_rcvd %ld win_jump_2k %ld hole_cnt %ld\n",
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_LATE_RX_MPDU,
-			     desc->info4),
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_WINDOW_JMP2K,
-			     desc->info4),
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_HOLE_COUNT,
-			     desc->info4));
-	ath11k_dbg(ab, ATH11K_DBG_HAL, "looping count %ld\n",
-		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO5_LOOPING_CNT,
-			     desc->info5));
+	ath11k_dbg(ab, ATH11K_DBG_HAL,
+		   "late_rcvd %u win_jump_2k %u hole_cnt %u\n",
+		   le32_get_bits(desc->info4,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_LATE_RX_MPDU),
+		   le32_get_bits(desc->info4,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_WINDOW_JMP2K),
+		   le32_get_bits(desc->info4,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_HOLE_COUNT));
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "looping count %u\n",
+		   le32_get_bits(desc->info5,
+				 HAL_REO_GET_QUEUE_STATS_STATUS_INFO5_LOOPING_CNT));
 }
 
 int ath11k_hal_reo_process_status(u8 *reo_desc, u8 *status)
@@ -502,9 +510,10 @@ int ath11k_hal_reo_process_status(u8 *reo_desc, u8 *status)
 	struct hal_reo_status_hdr *hdr;
 
 	hdr = (struct hal_reo_status_hdr *)tlv->value;
-	*status = FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS, hdr->info0);
+	*status = le32_get_bits(hdr->info0,
+				HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
 
-	return FIELD_GET(HAL_REO_STATUS_HDR_INFO0_STATUS_NUM, hdr->info0);
+	return le32_get_bits(hdr->info0, HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
 }
 
 void ath11k_hal_reo_flush_queue_status(struct ath11k_base *ab, u32 *reo_desc,
@@ -515,14 +524,14 @@ void ath11k_hal_reo_flush_queue_status(struct ath11k_base *ab, u32 *reo_desc,
 		(struct hal_reo_flush_queue_status *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_STATUS_NUM,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
 	status->uniform_hdr.cmd_status =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
 	status->u.flush_queue.err_detected =
-		FIELD_GET(HAL_REO_FLUSH_QUEUE_INFO0_ERR_DETECTED,
-			  desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_REO_FLUSH_QUEUE_INFO0_ERR_DETECTED);
 }
 
 void ath11k_hal_reo_flush_cache_status(struct ath11k_base *ab, u32 *reo_desc,
@@ -534,37 +543,37 @@ void ath11k_hal_reo_flush_cache_status(struct ath11k_base *ab, u32 *reo_desc,
 		(struct hal_reo_flush_cache_status *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_STATUS_NUM,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
 	status->uniform_hdr.cmd_status =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
 
 	status->u.flush_cache.err_detected =
-			FIELD_GET(HAL_REO_FLUSH_CACHE_STATUS_INFO0_IS_ERR,
-				  desc->info0);
+			le32_get_bits(desc->info0,
+				      HAL_REO_FLUSH_CACHE_STATUS_INFO0_IS_ERR);
 	status->u.flush_cache.err_code =
-		FIELD_GET(HAL_REO_FLUSH_CACHE_STATUS_INFO0_BLOCK_ERR_CODE,
-			  desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_REO_FLUSH_CACHE_STATUS_INFO0_BLOCK_ERR_CODE);
 	if (!status->u.flush_cache.err_code)
 		hal->avail_blk_resource |= BIT(hal->current_blk_index);
 
 	status->u.flush_cache.cache_controller_flush_status_hit =
-		FIELD_GET(HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_STATUS_HIT,
-			  desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_STATUS_HIT);
 
 	status->u.flush_cache.cache_controller_flush_status_desc_type =
-		FIELD_GET(HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_DESC_TYPE,
-			  desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_DESC_TYPE);
 	status->u.flush_cache.cache_controller_flush_status_client_id =
-		FIELD_GET(HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_CLIENT_ID,
-			  desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_CLIENT_ID);
 	status->u.flush_cache.cache_controller_flush_status_err =
-		FIELD_GET(HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_ERR,
-			  desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_ERR);
 	status->u.flush_cache.cache_controller_flush_status_cnt =
-		FIELD_GET(HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_COUNT,
-			  desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_REO_FLUSH_CACHE_STATUS_INFO0_FLUSH_COUNT);
 }
 
 void ath11k_hal_reo_unblk_cache_status(struct ath11k_base *ab, u32 *reo_desc,
@@ -576,18 +585,18 @@ void ath11k_hal_reo_unblk_cache_status(struct ath11k_base *ab, u32 *reo_desc,
 		(struct hal_reo_unblock_cache_status *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_STATUS_NUM,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
 	status->uniform_hdr.cmd_status =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
 
 	status->u.unblock_cache.err_detected =
-			FIELD_GET(HAL_REO_UNBLOCK_CACHE_STATUS_INFO0_IS_ERR,
-				  desc->info0);
+			le32_get_bits(desc->info0,
+				      HAL_REO_UNBLOCK_CACHE_STATUS_INFO0_IS_ERR);
 	status->u.unblock_cache.unblock_type =
-			FIELD_GET(HAL_REO_UNBLOCK_CACHE_STATUS_INFO0_TYPE,
-				  desc->info0);
+			le32_get_bits(desc->info0,
+				      HAL_REO_UNBLOCK_CACHE_STATUS_INFO0_TYPE);
 
 	if (!status->u.unblock_cache.err_detected &&
 	    status->u.unblock_cache.unblock_type ==
@@ -604,25 +613,25 @@ void ath11k_hal_reo_flush_timeout_list_status(struct ath11k_base *ab,
 		(struct hal_reo_flush_timeout_list_status *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_STATUS_NUM,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
 	status->uniform_hdr.cmd_status =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
 
 	status->u.timeout_list.err_detected =
-			FIELD_GET(HAL_REO_FLUSH_TIMEOUT_STATUS_INFO0_IS_ERR,
-				  desc->info0);
+			le32_get_bits(desc->info0,
+				      HAL_REO_FLUSH_TIMEOUT_STATUS_INFO0_IS_ERR);
 	status->u.timeout_list.list_empty =
-			FIELD_GET(HAL_REO_FLUSH_TIMEOUT_STATUS_INFO0_LIST_EMPTY,
-				  desc->info0);
+			le32_get_bits(desc->info0,
+				      HAL_REO_FLUSH_TIMEOUT_STATUS_INFO0_LIST_EMPTY);
 
 	status->u.timeout_list.release_desc_cnt =
-		FIELD_GET(HAL_REO_FLUSH_TIMEOUT_STATUS_INFO1_REL_DESC_COUNT,
-			  desc->info1);
+		le32_get_bits(desc->info1,
+			      HAL_REO_FLUSH_TIMEOUT_STATUS_INFO1_REL_DESC_COUNT);
 	status->u.timeout_list.fwd_buf_cnt =
-		FIELD_GET(HAL_REO_FLUSH_TIMEOUT_STATUS_INFO1_FWD_BUF_COUNT,
-			  desc->info1);
+		le32_get_bits(desc->info1,
+			      HAL_REO_FLUSH_TIMEOUT_STATUS_INFO1_FWD_BUF_COUNT);
 }
 
 void ath11k_hal_reo_desc_thresh_reached_status(struct ath11k_base *ab,
@@ -634,31 +643,31 @@ void ath11k_hal_reo_desc_thresh_reached_status(struct ath11k_base *ab,
 		(struct hal_reo_desc_thresh_reached_status *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_STATUS_NUM,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
 	status->uniform_hdr.cmd_status =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
-					  desc->hdr.info0);
+				le32_get_bits(desc->hdr.info0,
+					      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
 
 	status->u.desc_thresh_reached.threshold_idx =
-		FIELD_GET(HAL_REO_DESC_THRESH_STATUS_INFO0_THRESH_INDEX,
-			  desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_REO_DESC_THRESH_STATUS_INFO0_THRESH_INDEX);
 
 	status->u.desc_thresh_reached.link_desc_counter0 =
-		FIELD_GET(HAL_REO_DESC_THRESH_STATUS_INFO1_LINK_DESC_COUNTER0,
-			  desc->info1);
+		le32_get_bits(desc->info1,
+			      HAL_REO_DESC_THRESH_STATUS_INFO1_LINK_DESC_COUNTER0);
 
 	status->u.desc_thresh_reached.link_desc_counter1 =
-		FIELD_GET(HAL_REO_DESC_THRESH_STATUS_INFO2_LINK_DESC_COUNTER1,
-			  desc->info2);
+		le32_get_bits(desc->info2,
+			      HAL_REO_DESC_THRESH_STATUS_INFO2_LINK_DESC_COUNTER1);
 
 	status->u.desc_thresh_reached.link_desc_counter2 =
-		FIELD_GET(HAL_REO_DESC_THRESH_STATUS_INFO3_LINK_DESC_COUNTER2,
-			  desc->info3);
+		le32_get_bits(desc->info3,
+			      HAL_REO_DESC_THRESH_STATUS_INFO3_LINK_DESC_COUNTER2);
 
 	status->u.desc_thresh_reached.link_desc_counter_sum =
-		FIELD_GET(HAL_REO_DESC_THRESH_STATUS_INFO4_LINK_DESC_COUNTER_SUM,
-			  desc->info4);
+		le32_get_bits(desc->info4,
+			      HAL_REO_DESC_THRESH_STATUS_INFO4_LINK_DESC_COUNTER_SUM);
 }
 
 void ath11k_hal_reo_update_rx_reo_queue_status(struct ath11k_base *ab,
@@ -670,11 +679,11 @@ void ath11k_hal_reo_update_rx_reo_queue_status(struct ath11k_base *ab,
 		(struct hal_reo_status_hdr *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_STATUS_NUM,
-					  desc->info0);
+				le32_get_bits(desc->info0,
+					      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
 	status->uniform_hdr.cmd_status =
-				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
-					  desc->info0);
+				le32_get_bits(desc->info0,
+					      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
 }
 
 u32 ath11k_hal_reo_qdesc_size(u32 ba_window_size, u8 tid)
@@ -710,12 +719,15 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 				    HAL_DESC_REO_QUEUE_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_0);
 
-	qdesc->rx_queue_num = FIELD_PREP(HAL_RX_REO_QUEUE_RX_QUEUE_NUMBER, tid);
+	qdesc->rx_queue_num = le32_encode_bits(tid,
+					       HAL_RX_REO_QUEUE_RX_QUEUE_NUMBER);
 
 	qdesc->info0 =
-		FIELD_PREP(HAL_RX_REO_QUEUE_INFO0_VLD, 1) |
-		FIELD_PREP(HAL_RX_REO_QUEUE_INFO0_ASSOC_LNK_DESC_COUNTER, 1) |
-		FIELD_PREP(HAL_RX_REO_QUEUE_INFO0_AC, ath11k_tid_to_ac(tid));
+		le32_encode_bits(1, HAL_RX_REO_QUEUE_INFO0_VLD) |
+		le32_encode_bits(1,
+				 HAL_RX_REO_QUEUE_INFO0_ASSOC_LNK_DESC_COUNTER) |
+		le32_encode_bits(ath11k_tid_to_ac(tid),
+				 HAL_RX_REO_QUEUE_INFO0_AC);
 
 	if (ba_window_size < 1)
 		ba_window_size = 1;
@@ -724,10 +736,11 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 		ba_window_size++;
 
 	if (ba_window_size == 1)
-		qdesc->info0 |= FIELD_PREP(HAL_RX_REO_QUEUE_INFO0_RETRY, 1);
+		qdesc->info0 |= le32_encode_bits(1,
+						 HAL_RX_REO_QUEUE_INFO0_RETRY);
 
-	qdesc->info0 |= FIELD_PREP(HAL_RX_REO_QUEUE_INFO0_BA_WINDOW_SIZE,
-				   ba_window_size - 1);
+	qdesc->info0 |= le32_encode_bits(ba_window_size - 1,
+					 HAL_RX_REO_QUEUE_INFO0_BA_WINDOW_SIZE);
 	switch (type) {
 	case HAL_PN_TYPE_NONE:
 	case HAL_PN_TYPE_WAPI_EVEN:
@@ -735,22 +748,23 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 		break;
 	case HAL_PN_TYPE_WPA:
 		qdesc->info0 |=
-			FIELD_PREP(HAL_RX_REO_QUEUE_INFO0_PN_CHECK, 1) |
-			FIELD_PREP(HAL_RX_REO_QUEUE_INFO0_PN_SIZE,
-				   HAL_RX_REO_QUEUE_PN_SIZE_48);
+			le32_encode_bits(1, HAL_RX_REO_QUEUE_INFO0_PN_CHECK) |
+			le32_encode_bits(HAL_RX_REO_QUEUE_PN_SIZE_48,
+					 HAL_RX_REO_QUEUE_INFO0_PN_SIZE);
 		break;
 	}
 
 	/* TODO: Set Ignore ampdu flags based on BA window size and/or
 	 * AMPDU capabilities
 	 */
-	qdesc->info0 |= FIELD_PREP(HAL_RX_REO_QUEUE_INFO0_IGNORE_AMPDU_FLG, 1);
+	qdesc->info0 |= le32_encode_bits(1,
+					 HAL_RX_REO_QUEUE_INFO0_IGNORE_AMPDU_FLG);
 
-	qdesc->info1 |= FIELD_PREP(HAL_RX_REO_QUEUE_INFO1_SVLD, 0);
+	qdesc->info1 |= le32_encode_bits(0, HAL_RX_REO_QUEUE_INFO1_SVLD);
 
 	if (start_seq <= 0xfff)
-		qdesc->info1 = FIELD_PREP(HAL_RX_REO_QUEUE_INFO1_SSN,
-					  start_seq);
+		qdesc->info1 = le32_encode_bits(start_seq,
+						HAL_RX_REO_QUEUE_INFO1_SSN);
 
 	if (tid == HAL_DESC_REO_NON_QOS_TID)
 		return;
@@ -801,7 +815,8 @@ void ath11k_hal_reo_init_cmd_ring(struct ath11k_base *ab,
 		tlv = (struct hal_tlv_hdr *)entry;
 		desc = (struct hal_reo_get_queue_stats *)tlv->value;
 		desc->cmd.info0 =
-			FIELD_PREP(HAL_REO_CMD_HDR_INFO0_CMD_NUMBER, cmd_num++);
+			le32_encode_bits(cmd_num++,
+					 HAL_REO_CMD_HDR_INFO0_CMD_NUMBER);
 		entry += entry_size;
 	}
 }
@@ -825,11 +840,11 @@ ath11k_hal_rx_populate_byte_count(void *rx_tlv, void *ppduinfo,
 	struct hal_rx_ppdu_end_user_stats *ppdu_end_user = rx_tlv;
 
 	rx_user_status->mpdu_ok_byte_count =
-		FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_OK_BYTE_COUNT,
-			  __le32_to_cpu(ppdu_end_user->info8));
+		le32_get_bits(ppdu_end_user->info8,
+			      HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_OK_BYTE_COUNT);
 	rx_user_status->mpdu_err_byte_count =
-		FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO9_MPDU_ERR_BYTE_COUNT,
-			  __le32_to_cpu(ppdu_end_user->info9));
+		le32_get_bits(ppdu_end_user->info9,
+			      HAL_RX_PPDU_END_USER_STATS_INFO9_MPDU_ERR_BYTE_COUNT);
 }
 
 static inline void
@@ -886,8 +901,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 			(struct hal_rx_ppdu_start *)tlv_data;
 
 		ppdu_info->ppdu_id =
-			FIELD_GET(HAL_RX_PPDU_START_INFO0_PPDU_ID,
-				  __le32_to_cpu(ppdu_start->info0));
+			le32_get_bits(ppdu_start->info0,
+				      HAL_RX_PPDU_START_INFO0_PPDU_ID);
 		ppdu_info->chan_num = __le32_to_cpu(ppdu_start->chan_num);
 		ppdu_info->ppdu_ts = __le32_to_cpu(ppdu_start->ppdu_start_ts);
 		break;
@@ -900,23 +915,23 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		info1 = __le32_to_cpu(eu_stats->info1);
 
 		ppdu_info->ast_index =
-			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO2_AST_INDEX,
-				  __le32_to_cpu(eu_stats->info2));
+			le32_get_bits(eu_stats->info2,
+				      HAL_RX_PPDU_END_USER_STATS_INFO2_AST_INDEX);
 		ppdu_info->tid =
-			ffs(FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO7_TID_BITMAP,
-				      __le32_to_cpu(eu_stats->info7))) - 1;
+			ffs(le32_get_bits(eu_stats->info7,
+					  HAL_RX_PPDU_END_USER_STATS_INFO7_TID_BITMAP)) - 1;
 		ppdu_info->tcp_msdu_count =
-			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO4_TCP_MSDU_CNT,
-				  __le32_to_cpu(eu_stats->info4));
+			le32_get_bits(eu_stats->info4,
+				      HAL_RX_PPDU_END_USER_STATS_INFO4_TCP_MSDU_CNT);
 		ppdu_info->udp_msdu_count =
-			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO4_UDP_MSDU_CNT,
-				  __le32_to_cpu(eu_stats->info4));
+			le32_get_bits(eu_stats->info4,
+				      HAL_RX_PPDU_END_USER_STATS_INFO4_UDP_MSDU_CNT);
 		ppdu_info->other_msdu_count =
-			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO5_OTHER_MSDU_CNT,
-				  __le32_to_cpu(eu_stats->info5));
+			le32_get_bits(eu_stats->info5,
+				      HAL_RX_PPDU_END_USER_STATS_INFO5_OTHER_MSDU_CNT);
 		ppdu_info->tcp_ack_msdu_count =
-			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO5_TCP_ACK_MSDU_CNT,
-				  __le32_to_cpu(eu_stats->info5));
+			le32_get_bits(eu_stats->info5,
+				      HAL_RX_PPDU_END_USER_STATS_INFO5_TCP_ACK_MSDU_CNT);
 		ppdu_info->preamble_type =
 			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO1_PKT_TYPE, info1);
 		ppdu_info->num_mpdu_fcs_ok =
@@ -957,12 +972,18 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 	case HAL_RX_PPDU_END_USER_STATS_EXT: {
 		struct hal_rx_ppdu_end_user_stats_ext *eu_stats =
 			(struct hal_rx_ppdu_end_user_stats_ext *)tlv_data;
-		ppdu_info->userstats.mpdu_fcs_ok_bitmap[2] = eu_stats->info1;
-		ppdu_info->userstats.mpdu_fcs_ok_bitmap[3] = eu_stats->info2;
-		ppdu_info->userstats.mpdu_fcs_ok_bitmap[4] = eu_stats->info3;
-		ppdu_info->userstats.mpdu_fcs_ok_bitmap[5] = eu_stats->info4;
-		ppdu_info->userstats.mpdu_fcs_ok_bitmap[6] = eu_stats->info5;
-		ppdu_info->userstats.mpdu_fcs_ok_bitmap[7] = eu_stats->info6;
+		ppdu_info->userstats.mpdu_fcs_ok_bitmap[2] =
+			__le32_to_cpu(eu_stats->info1);
+		ppdu_info->userstats.mpdu_fcs_ok_bitmap[3] =
+			__le32_to_cpu(eu_stats->info2);
+		ppdu_info->userstats.mpdu_fcs_ok_bitmap[4] =
+			__le32_to_cpu(eu_stats->info3);
+		ppdu_info->userstats.mpdu_fcs_ok_bitmap[5] =
+			__le32_to_cpu(eu_stats->info4);
+		ppdu_info->userstats.mpdu_fcs_ok_bitmap[6] =
+			__le32_to_cpu(eu_stats->info5);
+		ppdu_info->userstats.mpdu_fcs_ok_bitmap[7] =
+			__le32_to_cpu(eu_stats->info6);
 		break;
 	}
 	case HAL_PHYRX_HT_SIG: {
@@ -1004,8 +1025,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		struct hal_rx_lsig_b_info *lsigb =
 			(struct hal_rx_lsig_b_info *)tlv_data;
 
-		ppdu_info->rate = FIELD_GET(HAL_RX_LSIG_B_INFO_INFO0_RATE,
-					    __le32_to_cpu(lsigb->info0));
+		ppdu_info->rate = le32_get_bits(lsigb->info0,
+						HAL_RX_LSIG_B_INFO_INFO0_RATE);
 		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
 		break;
 	}
@@ -1013,8 +1034,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		struct hal_rx_lsig_a_info *lsiga =
 			(struct hal_rx_lsig_a_info *)tlv_data;
 
-		ppdu_info->rate = FIELD_GET(HAL_RX_LSIG_A_INFO_INFO0_RATE,
-					    __le32_to_cpu(lsiga->info0));
+		ppdu_info->rate = le32_get_bits(lsiga->info0,
+						HAL_RX_LSIG_A_INFO_INFO0_RATE);
 		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
 		break;
 	}
@@ -1452,8 +1473,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		 * PHYRX_OTHER_RECEIVE_INFO TLV.
 		 */
 		ppdu_info->rssi_comb =
-			FIELD_GET(HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RSSI_COMB,
-				  __le32_to_cpu(rssi->info0));
+			le32_get_bits(rssi->info0,
+				      HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RSSI_COMB);
 
 		if (db2dbm) {
 			for (i = 0; i < ARRAY_SIZE(rssi->preamble); i++) {
@@ -1475,8 +1496,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		struct hal_rx_ppdu_end_duration *ppdu_rx_duration =
 			(struct hal_rx_ppdu_end_duration *)tlv_data;
 		ppdu_info->rx_duration =
-			FIELD_GET(HAL_RX_PPDU_END_DURATION,
-				  __le32_to_cpu(ppdu_rx_duration->info0));
+			le32_get_bits(ppdu_rx_duration->info0,
+				      HAL_RX_PPDU_END_DURATION);
 		ppdu_info->tsft = __le32_to_cpu(ppdu_rx_duration->rsvd0[1]);
 		ppdu_info->tsft = (ppdu_info->tsft << 32) |
 					__le32_to_cpu(ppdu_rx_duration->rsvd0[0]);
@@ -1508,9 +1529,9 @@ ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 
 	do {
 		tlv = (struct hal_tlv_hdr *)ptr;
-		tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl);
-		tlv_len = FIELD_GET(HAL_TLV_HDR_LEN, tlv->tl);
-		tlv_userid = FIELD_GET(HAL_TLV_USR_ID, tlv->tl);
+		tlv_tag = le32_get_bits(tlv->tl, HAL_TLV_HDR_TAG);
+		tlv_len = le32_get_bits(tlv->tl, HAL_TLV_HDR_LEN);
+		tlv_userid = le32_get_bits(tlv->tl, HAL_TLV_USR_ID);
 		ptr += sizeof(*tlv);
 
 		/* The actual length of PPDU_END is the combined length of many PHY
@@ -1544,20 +1565,20 @@ void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc, dma_addr_t *paddr,
 	rx_mpdu_desc_info_details =
 			(struct rx_mpdu_desc *)&reo_ent_ring->rx_mpdu_info;
 
-	*msdu_cnt = FIELD_GET(RX_MPDU_DESC_INFO0_MSDU_COUNT,
-			      rx_mpdu_desc_info_details->info0);
+	*msdu_cnt = le32_get_bits(rx_mpdu_desc_info_details->info0,
+				  RX_MPDU_DESC_INFO0_MSDU_COUNT);
 
 	buf_addr_info = (struct ath11k_buffer_addr *)&reo_ent_ring->buf_addr_info;
 
-	*paddr = (((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR,
-				  buf_addr_info->info1)) << 32) |
-			FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
-				  buf_addr_info->info0);
+	*paddr = (((u64)le32_get_bits(buf_addr_info->info1,
+		  BUFFER_ADDR_INFO1_ADDR)) << 32) |
+			le32_get_bits(buf_addr_info->info0,
+				      BUFFER_ADDR_INFO0_ADDR);
 
-	*sw_cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-			       buf_addr_info->info1);
-	*rbm = FIELD_GET(BUFFER_ADDR_INFO1_RET_BUF_MGR,
-			 buf_addr_info->info1);
+	*sw_cookie = le32_get_bits(buf_addr_info->info1,
+				   BUFFER_ADDR_INFO1_SW_COOKIE);
+	*rbm = le32_get_bits(buf_addr_info->info1,
+			     BUFFER_ADDR_INFO1_RET_BUF_MGR);
 
 	*pp_buf_addr = (void *)buf_addr_info;
 }
@@ -1573,35 +1594,36 @@ ath11k_hal_rx_sw_mon_ring_buf_paddr_get(void *rx_desc,
 
 	rx_mpdu_desc_info_details = &sw_mon_ring->rx_mpdu_info;
 
-	sw_mon_entries->msdu_cnt = FIELD_GET(RX_MPDU_DESC_INFO0_MSDU_COUNT,
-					     rx_mpdu_desc_info_details->info0);
+	sw_mon_entries->msdu_cnt = le32_get_bits(rx_mpdu_desc_info_details->info0,
+						 RX_MPDU_DESC_INFO0_MSDU_COUNT);
 
 	buf_addr_info = &sw_mon_ring->buf_addr_info;
 	status_buf_addr_info = &sw_mon_ring->status_buf_addr_info;
 
-	sw_mon_entries->mon_dst_paddr = (((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR,
-					buf_addr_info->info1)) << 32) |
-					FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
-						  buf_addr_info->info0);
+	sw_mon_entries->mon_dst_paddr = (((u64)le32_get_bits(buf_addr_info->info1,
+					 BUFFER_ADDR_INFO1_ADDR)) << 32) |
+					le32_get_bits(buf_addr_info->info0,
+						      BUFFER_ADDR_INFO0_ADDR);
 
 	sw_mon_entries->mon_status_paddr =
-			(((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR,
-					 status_buf_addr_info->info1)) << 32) |
-				FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
-					  status_buf_addr_info->info0);
+			(((u64)le32_get_bits(status_buf_addr_info->info1,
+			 BUFFER_ADDR_INFO1_ADDR)) << 32) |
+				le32_get_bits(status_buf_addr_info->info0,
+					      BUFFER_ADDR_INFO0_ADDR);
 
-	sw_mon_entries->mon_dst_sw_cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-						      buf_addr_info->info1);
+	sw_mon_entries->mon_dst_sw_cookie = le32_get_bits(buf_addr_info->info1,
+							  BUFFER_ADDR_INFO1_SW_COOKIE);
 
-	sw_mon_entries->mon_status_sw_cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-							 status_buf_addr_info->info1);
+	sw_mon_entries->mon_status_sw_cookie = le32_get_bits(status_buf_addr_info->info1,
+							     BUFFER_ADDR_INFO1_SW_COOKIE);
 
-	sw_mon_entries->status_buf_count = FIELD_GET(HAL_SW_MON_RING_INFO0_STATUS_BUF_CNT,
-						     sw_mon_ring->info0);
+	sw_mon_entries->status_buf_count = le32_get_bits(sw_mon_ring->info0,
+							 HAL_SW_MON_RING_INFO0_STATUS_BUF_CNT);
 
 	sw_mon_entries->dst_buf_addr_info = buf_addr_info;
 	sw_mon_entries->status_buf_addr_info = status_buf_addr_info;
 
 	sw_mon_entries->ppdu_id =
-		FIELD_GET(HAL_SW_MON_RING_INFO1_PHY_PPDU_ID, sw_mon_ring->info1);
+		le32_get_bits(sw_mon_ring->info1,
+			      HAL_SW_MON_RING_INFO1_PHY_PPDU_ID);
 }
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 475807b89a1a..e19d9fc92e99 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -247,13 +247,13 @@ struct hal_rx_ppdu_end_user_stats {
 } __packed;
 
 struct hal_rx_ppdu_end_user_stats_ext {
-	u32 info0;
-	u32 info1;
-	u32 info2;
-	u32 info3;
-	u32 info4;
-	u32 info5;
-	u32 info6;
+	__le32 info0;
+	__le32 info1;
+	__le32 info2;
+	__le32 info3;
+	__le32 info4;
+	__le32 info5;
+	__le32 info6;
 } __packed;
 
 #define HAL_RX_HT_SIG_INFO_INFO0_MCS		GENMASK(6, 0)
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
index b7e9b1cdd76a..d208322d4d21 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
@@ -40,40 +40,43 @@ void ath11k_hal_tx_cmd_desc_setup(struct ath11k_base *ab, void *cmd,
 	struct hal_tcl_data_cmd *tcl_cmd = cmd;
 
 	tcl_cmd->buf_addr_info.info0 =
-		FIELD_PREP(BUFFER_ADDR_INFO0_ADDR, ti->paddr);
+		le32_encode_bits(ti->paddr, BUFFER_ADDR_INFO0_ADDR);
 	tcl_cmd->buf_addr_info.info1 =
-		FIELD_PREP(BUFFER_ADDR_INFO1_ADDR,
-			   ((uint64_t)ti->paddr >> HAL_ADDR_MSB_REG_SHIFT));
+		le32_encode_bits(((uint64_t)ti->paddr >> HAL_ADDR_MSB_REG_SHIFT),
+				 BUFFER_ADDR_INFO1_ADDR);
 	tcl_cmd->buf_addr_info.info1 |=
-		FIELD_PREP(BUFFER_ADDR_INFO1_RET_BUF_MGR, ti->rbm_id) |
-		FIELD_PREP(BUFFER_ADDR_INFO1_SW_COOKIE, ti->desc_id);
+		le32_encode_bits(ti->rbm_id, BUFFER_ADDR_INFO1_RET_BUF_MGR) |
+		le32_encode_bits(ti->desc_id, BUFFER_ADDR_INFO1_SW_COOKIE);
 
 	tcl_cmd->info0 =
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_DESC_TYPE, ti->type) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_ENCAP_TYPE, ti->encap_type) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_ENCRYPT_TYPE,
-			   ti->encrypt_type) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_SEARCH_TYPE,
-			   ti->search_type) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_ADDR_EN,
-			   ti->addr_search_flags) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_CMD_NUM,
-			   ti->meta_data_flags);
-
-	tcl_cmd->info1 = ti->flags0 |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_DATA_LEN, ti->data_len) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_PKT_OFFSET, ti->pkt_offset);
-
-	tcl_cmd->info2 = ti->flags1 |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_TID, ti->tid) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_LMAC_ID, ti->lmac_id);
-
-	tcl_cmd->info3 = FIELD_PREP(HAL_TCL_DATA_CMD_INFO3_DSCP_TID_TABLE_IDX,
-				    ti->dscp_tid_tbl_idx) |
-			 FIELD_PREP(HAL_TCL_DATA_CMD_INFO3_SEARCH_INDEX,
-				    ti->bss_ast_idx) |
-			 FIELD_PREP(HAL_TCL_DATA_CMD_INFO3_CACHE_SET_NUM,
-				    ti->bss_ast_hash);
+		le32_encode_bits(ti->type, HAL_TCL_DATA_CMD_INFO0_DESC_TYPE) |
+		le32_encode_bits(ti->encap_type,
+				 HAL_TCL_DATA_CMD_INFO0_ENCAP_TYPE) |
+		le32_encode_bits(ti->encrypt_type,
+				 HAL_TCL_DATA_CMD_INFO0_ENCRYPT_TYPE) |
+		le32_encode_bits(ti->search_type,
+				 HAL_TCL_DATA_CMD_INFO0_SEARCH_TYPE) |
+		le32_encode_bits(ti->addr_search_flags,
+				 HAL_TCL_DATA_CMD_INFO0_ADDR_EN) |
+		le32_encode_bits(ti->meta_data_flags,
+				 HAL_TCL_DATA_CMD_INFO0_CMD_NUM);
+
+	tcl_cmd->info1 = cpu_to_le32(ti->flags0) |
+		le32_encode_bits(ti->data_len,
+				 HAL_TCL_DATA_CMD_INFO1_DATA_LEN) |
+		le32_encode_bits(ti->pkt_offset,
+				 HAL_TCL_DATA_CMD_INFO1_PKT_OFFSET);
+
+	tcl_cmd->info2 = cpu_to_le32(ti->flags1) |
+		le32_encode_bits(ti->tid, HAL_TCL_DATA_CMD_INFO2_TID) |
+		le32_encode_bits(ti->lmac_id, HAL_TCL_DATA_CMD_INFO2_LMAC_ID);
+
+	tcl_cmd->info3 = le32_encode_bits(ti->dscp_tid_tbl_idx,
+					  HAL_TCL_DATA_CMD_INFO3_DSCP_TID_TABLE_IDX) |
+			 le32_encode_bits(ti->bss_ast_idx,
+					  HAL_TCL_DATA_CMD_INFO3_SEARCH_INDEX) |
+			 le32_encode_bits(ti->bss_ast_hash,
+					  HAL_TCL_DATA_CMD_INFO3_CACHE_SET_NUM);
 	tcl_cmd->info4 = 0;
 
 	if (ti->enable_mesh)
@@ -86,7 +89,7 @@ void ath11k_hal_tx_set_dscp_tid_map(struct ath11k_base *ab, int id)
 	u32 addr;
 	u8 hw_map_val[HAL_DSCP_TID_TBL_SIZE];
 	int i;
-	u32 value;
+	__le32 value;
 	int cnt = 0;
 
 	ctrl_reg_val = ath11k_hif_read32(ab, HAL_SEQ_WCSS_UMAC_TCL_REG +
@@ -103,28 +106,29 @@ void ath11k_hal_tx_set_dscp_tid_map(struct ath11k_base *ab, int id)
 	 * three bytes in an iteration.
 	 */
 	for (i = 0; i < DSCP_TID_MAP_TBL_ENTRY_SIZE; i += 8) {
-		value = FIELD_PREP(HAL_TCL1_RING_FIELD_DSCP_TID_MAP0,
-				   dscp_tid_map[i]) |
-			FIELD_PREP(HAL_TCL1_RING_FIELD_DSCP_TID_MAP1,
-				   dscp_tid_map[i + 1]) |
-			FIELD_PREP(HAL_TCL1_RING_FIELD_DSCP_TID_MAP2,
-				   dscp_tid_map[i + 2]) |
-			FIELD_PREP(HAL_TCL1_RING_FIELD_DSCP_TID_MAP3,
-				   dscp_tid_map[i + 3]) |
-			FIELD_PREP(HAL_TCL1_RING_FIELD_DSCP_TID_MAP4,
-				   dscp_tid_map[i + 4]) |
-			FIELD_PREP(HAL_TCL1_RING_FIELD_DSCP_TID_MAP5,
-				   dscp_tid_map[i + 5]) |
-			FIELD_PREP(HAL_TCL1_RING_FIELD_DSCP_TID_MAP6,
-				   dscp_tid_map[i + 6]) |
-			FIELD_PREP(HAL_TCL1_RING_FIELD_DSCP_TID_MAP7,
-				   dscp_tid_map[i + 7]);
+		value = le32_encode_bits(dscp_tid_map[i],
+					 HAL_TCL1_RING_FIELD_DSCP_TID_MAP0) |
+			le32_encode_bits(dscp_tid_map[i + 1],
+					 HAL_TCL1_RING_FIELD_DSCP_TID_MAP1) |
+			le32_encode_bits(dscp_tid_map[i + 2],
+					 HAL_TCL1_RING_FIELD_DSCP_TID_MAP2) |
+			le32_encode_bits(dscp_tid_map[i + 3],
+					 HAL_TCL1_RING_FIELD_DSCP_TID_MAP3) |
+			le32_encode_bits(dscp_tid_map[i + 4],
+					 HAL_TCL1_RING_FIELD_DSCP_TID_MAP4) |
+			le32_encode_bits(dscp_tid_map[i + 5],
+					 HAL_TCL1_RING_FIELD_DSCP_TID_MAP5) |
+			le32_encode_bits(dscp_tid_map[i + 6],
+					 HAL_TCL1_RING_FIELD_DSCP_TID_MAP6) |
+			le32_encode_bits(dscp_tid_map[i + 7],
+					 HAL_TCL1_RING_FIELD_DSCP_TID_MAP7);
 		memcpy(&hw_map_val[cnt], (u8 *)&value, 3);
 		cnt += 3;
 	}
 
 	for (i = 0; i < HAL_DSCP_TID_TBL_SIZE; i += 4) {
-		ath11k_hif_write32(ab, addr, *(u32 *)&hw_map_val[i]);
+		ath11k_hif_write32(ab, addr,
+				   le32_to_cpu(*(__le32 *)&hw_map_val[i]));
 		addr += 4;
 	}
 
@@ -152,9 +156,9 @@ void ath11k_hal_tx_init_data_ring(struct ath11k_base *ab, struct hal_srng *srng)
 
 	for (i = 0; i < params.num_entries; i++) {
 		tlv = (struct hal_tlv_hdr *)desc;
-		tlv->tl = FIELD_PREP(HAL_TLV_HDR_TAG, HAL_TCL_DATA_CMD) |
-			  FIELD_PREP(HAL_TLV_HDR_LEN,
-				     sizeof(struct hal_tcl_data_cmd));
+		tlv->tl = le32_encode_bits(HAL_TCL_DATA_CMD, HAL_TLV_HDR_TAG) |
+			  le32_encode_bits(sizeof(struct hal_tcl_data_cmd),
+					   HAL_TLV_HDR_LEN);
 		desc += entry_size;
 	}
 }
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..c83b058e18f7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -37,22 +37,19 @@ static u8 ath11k_hw_ipq6018_mac_from_pdev_id(int pdev_idx)
 static void ath11k_hw_ipq8074_tx_mesh_enable(struct ath11k_base *ab,
 					     struct hal_tcl_data_cmd *tcl_cmd)
 {
-	tcl_cmd->info2 |= FIELD_PREP(HAL_IPQ8074_TCL_DATA_CMD_INFO2_MESH_ENABLE,
-				     true);
+	tcl_cmd->info2 |= le32_encode_bits(true, HAL_IPQ8074_TCL_DATA_CMD_INFO2_MESH_ENABLE);
 }
 
 static void ath11k_hw_qcn9074_tx_mesh_enable(struct ath11k_base *ab,
 					     struct hal_tcl_data_cmd *tcl_cmd)
 {
-	tcl_cmd->info3 |= FIELD_PREP(HAL_QCN9074_TCL_DATA_CMD_INFO3_MESH_ENABLE,
-				     true);
+	tcl_cmd->info3 |= le32_encode_bits(true, HAL_QCN9074_TCL_DATA_CMD_INFO3_MESH_ENABLE);
 }
 
 static void ath11k_hw_wcn6855_tx_mesh_enable(struct ath11k_base *ab,
 					     struct hal_tcl_data_cmd *tcl_cmd)
 {
-	tcl_cmd->info3 |= FIELD_PREP(HAL_QCN9074_TCL_DATA_CMD_INFO3_MESH_ENABLE,
-				     true);
+	tcl_cmd->info3 |= le32_encode_bits(true, HAL_QCN9074_TCL_DATA_CMD_INFO3_MESH_ENABLE);
 }
 
 static void ath11k_init_wmi_config_qca6390(struct ath11k_base *ab,

-- 
2.53.0


