Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F115C43334
	for <ath11k@archiver.kernel.org>; Thu, 21 Jul 2022 08:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcVhiM2yDVj1/qTlVbUy79IpDfJndCxoy/UWgMPj3Ts=; b=I5GKnS9l3QbEuC
	5ore9Xe0bAlatTYBt+NA1gvufrNi2s+pUdOArin6KxgtJb8qHz8tIZ1j9fmECs54eYKUmO3fDGkRY
	geVNwCGZ3uhVs6LGiwXyMV4a/MLEk/p7PKbZOkSZ51TLFaBxnZcqvc2PKhyxOoZNWK15cMO5c2B60
	fs77LPhkaoT4oTDdXhyYuVYK0zIkL9huMMbubZrYnIdQSZgmNvTdHyZuFYvDbsaJ4jGvRNddqzfhO
	+3TiSY+kJXGEuntT1ERjFG+3v9EgMnuUWccehTGLrAHufEWDpBfoQuoeAHZKO7SrIAj59E3tH/asP
	E6GDooMFHGMJRzuCUHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERf1-002bI5-A2; Thu, 21 Jul 2022 08:35:55 +0000
Received: from mail-db8eur05on2040.outbound.protection.outlook.com ([40.107.20.40] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERex-002b9N-JM
	for ath11k@lists.infradead.org; Thu, 21 Jul 2022 08:35:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZInqv77kIwXzMTNuujh+Hr+qJTDV9t9s5pvUFhSy8+3bfafO5j2a8idFBR1ZHSHWOkPC5bW7cDSzMkZlredBFuOryT8FNtt1UjvqImBQlD2GoD4yLwNAi4vTFDMcaL/iDfNG5PziR/tVOMzKdsxP3refmKhrtplxNaARG9IUfpeupTrrXoMWYqM30NoLLPsYRuZgS96/U2IFyCbCIQmxjXR0Vev3G6KFZYVQ9k6Y5kPIc6h1t1Mjc6m5fwgBkN3P8nYFCMEZvzrTkmYlOwOJP/a4D2ODI2DYY7hJEMbszZ77KeTnQGeyt9AHQum6WMUgFE4cjBbAa77njmAnfhjK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyukKJ/76t274nt83K4KtjlE5gI9Gq5/l1v2AZQFy9E=;
 b=RteYr8tBA709vco7+cGu0XZmJsCZud2TG/fxka46Kd65kyPoS55e0135WetMhNvrvqoInHISkg+//LttOPMmiLrRfC1q87oUQFZcdijmgFDrTtnu1gzgEtKc4aAThg10pvsI3Qm2UKUoR2QK9epg8Fesa6DerCR4wITwLPaIqiYrVx3kD/KW4uFwFVXf/gdAZiDmF6td4iun5tQ+Pm4xufL7Pu05z6nCwUzRsIu1GPC1YhyH7DdYWoWkqrFN5pMFROInSN7FlxZmkvL3f188Sc+v9OvKKn85zhsjQnTMxCHiW6drLOjD9G9BhXyOJIGbOtACI1DNXlk6It/ezJ3QGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyukKJ/76t274nt83K4KtjlE5gI9Gq5/l1v2AZQFy9E=;
 b=sl33opFyUjRW+7th5ytaj8JnLpEo8HgYWWk1qL0KBUeqFV4fGXc5ltWSmHNFHHUSBYRNVOeMeMkeZIxMZ2fxnIK10DQY8dhuYy48y26a9ckX9gZ0QnA1/qvpqcfso3EedCJkVwPJpEgUTTmkUY9QOnM1PrvZ+Yf0bH5sYdM1esC+Narr8ea0dELPkDPDQg6QZTqWRYHgPaXXVuBlkqv5TXwENZlOPIfv4h3PvVGK+rhZ3Wo447EA9i7yAhDDH4g9cLxornRZmxhEdFbF7WHR7Gzk50TVu4hvEcdDzZkwk8x1p/G0dbrtOn17+zl1eFCr2D8FjVE3NpGLhyxOhPKvRQ==
Received: from AS4P192MB1503.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:4b2::15)
 by DB9P192MB1130.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Thu, 21 Jul
 2022 08:35:45 +0000
Received: from AS4P192MB1503.EURP192.PROD.OUTLOOK.COM
 ([fe80::ecb5:e680:257a:b333]) by AS4P192MB1503.EURP192.PROD.OUTLOOK.COM
 ([fe80::ecb5:e680:257a:b333%9]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 08:35:45 +0000
From: Antonin GODARD <agodard@witekio.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: ath11k and P2P
Thread-Topic: ath11k and P2P
Thread-Index: AQHYnNxLJrwLp2CF5Emm4W40L0xKVA==
Date: Thu, 21 Jul 2022 08:35:45 +0000
Message-ID:  <AS4P192MB150315B3727210918C6A6A7EAD919@AS4P192MB1503.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9310579-07c2-4a49-dc37-08da6af40151
x-ms-traffictypediagnostic: DB9P192MB1130:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /bqELfFf2LaNcIrlvERhJFSSPBSc+9VS9uEA0NUMXrtwmnn+iIzEvgHmMyOvRAYcpO2wHWLKL4hG5y5u6Dw1xQMzXGNTk8bMJovzHC8whNEQ/0SdwPQsyi0VDsV35CmSyIfPjaTLLAJ9CM5sWbZe1lnoMPdU8dlJMo1l+fmxJKLRMjqyNcuXyg57PSkY36RTw79CaNrF9rnMg5RSTFbeJ3GlgrxTTE9W14gr4VmksFPwKiSE5FtE/EOu6LPGlQuENCRUtlVf9Ohq+/NGbIvRGm9c3Ia9zNTLDq57+TCiAvxbEuGuwN0SxmT3OvZtuwlAQf4YWaUc+xIh6WMRARIxwUAZ01DIAXre9W4F0D4PdDrXhevOhbSv5/o5pXVuhAU2Xi/Wq41rPKQ4zeWY2EzlNbGbl7zs9TCknwB//6Rf+nd3jDXMO+9o7PKs9mt7rsAdfN988kxv6sWfIkNRSr31oKFmyqpje9lUQoNsX1CqmLtybG08UGs6XsqzJVN8PXmR5LWDULcpHaY0enG+IMkd/pij5qwdct8x9RQxxeh0Brz0nnfohrEHirgaSNuRjXvPlUhl3DrrjcTD9VkXEq1sMfyotSsrzLORv7uu3nU2YQdZkw2zK/L8GoBcTqfaf8zrd+LrS4QtSqrxuM+nCGvsD2no85oZQFcRr/4l0/itGibFKMYRHO6H6WyHc4hBwmNYw5Ze6lzAaR1xLPGV5eogdNtboYIUxShpwySzLG0mH4eqj8tXXGLvM5lRpYLgMX+EOHsB5PmMVtgo9IMi8NyI1ozp9lN2HDQO/pNuvjHwYI4EnPUWaNKxR8v+ciRFscSX
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P192MB1503.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(376002)(396003)(39850400004)(66446008)(8676002)(66946007)(316002)(8936002)(64756008)(38070700005)(122000001)(7116003)(4744005)(66476007)(33656002)(76116006)(6916009)(91956017)(52536014)(86362001)(2906002)(38100700002)(66556008)(5660300002)(26005)(7696005)(6506007)(71200400001)(186003)(41300700001)(55016003)(9686003)(83380400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?FcIWuvfNU3wmzbKBzc+/vcTRsIyaXmvo4Ot/rccRmP62/XEV9yc7VdoIgV?=
 =?iso-8859-1?Q?JVIIwMkgHOaTcqXhHF5S/h6s+Po18FhrhsFvA9mioELDaUvkTCPSXUByBQ?=
 =?iso-8859-1?Q?tFvSTcl40lbDTM75p9nW3nMqC1w5c6zH/+AHcA6LjaWYkL7G89q2l759hD?=
 =?iso-8859-1?Q?RamFHkRrYB72sQlQdqL0WqyguGSw0cRoRFpqazsClERFvMiuCH8P3kUJU7?=
 =?iso-8859-1?Q?/XrMBUd1W1ml54C7tHYeaLKn2msk7cgTEfpjunFUSgmcmY+GHIhzgH/b/G?=
 =?iso-8859-1?Q?CHRIzJ2Gfh5GFaQVFWiIJs09t3VSsovCjPPNYGY/5nyOcsU2eulxftMYIr?=
 =?iso-8859-1?Q?EPBen2tT0/Vv5MzCo5zd8DGWmJ5YqwHWboo7s/pYJ5yL3hqpyPCLKknWRM?=
 =?iso-8859-1?Q?VQERSWOgz3btp7ud1ITUekfb8eWaiaJFF2lnqNGJSPnmQGEsDRK++k8MKT?=
 =?iso-8859-1?Q?dmIDfNbQ4pqY/NOlhUBZ1yoB/9IDyWb/hgqK1czMZDaEHQ3nFITUUuCriP?=
 =?iso-8859-1?Q?L+yN9iGpCGjuQi7xfjhQ+vmrAf8CHavbv16Sh5QyhTDlFGgE/tGtVE8Lsu?=
 =?iso-8859-1?Q?wDjbLsPdokFuwPxuuk3n6Pit516ZdtlRhXAl7LZ4cDt9NAHD6N8RzUEEer?=
 =?iso-8859-1?Q?WGCnIHZvex30cjmNNP21Gb+DbWbXwR4VLRNHDSLxrc2Q9H03h113HdurS+?=
 =?iso-8859-1?Q?45vOj+LFPPD1KkpjugChU58RC5w787i0nreecROmdg7yB4AoMFtCLxhWN+?=
 =?iso-8859-1?Q?OIGx7oEErWX9ZhLqhj7e8Y/pn9UlCZv8IV9+iyRv6T34GuRYW6u1CVEtV8?=
 =?iso-8859-1?Q?XWQrHpl0fDpbTm3qCcRgUQNmSvLIJPuPP+df53KLKHmWY/XM400BndfU0K?=
 =?iso-8859-1?Q?vX2lv0J9qXIlYzE2sNufFBpB8LX0XwNgTw2wGQUCQzAtYO0ggLl/jX+CxT?=
 =?iso-8859-1?Q?PNQCe7TpL6MznqQ5n3pB/v6awFnUI+y8FQxnMSeoc99aijtfoCjGFRsxFH?=
 =?iso-8859-1?Q?V2g8gmWucfvcs16HyqNxA94L2NL4PQ31m0b5jdIGzvaetVvT1ofnIdQK3h?=
 =?iso-8859-1?Q?dteiEammEemThS7raE2DElwIoMTUByv90qvpVlEI2WChkVPGY06zDXXcp+?=
 =?iso-8859-1?Q?qMNDOewR4oydHhnTmfDUkG1lZeNqpTGpbdl1J1VnzAAKVecn2zhyG+R8jt?=
 =?iso-8859-1?Q?jv/pmB0nwroGlvcdinU8rJ91wuYvjkrBiB6Fpq2PcJ/URlPujYXaUHtJfp?=
 =?iso-8859-1?Q?AQy76JJyI2gV/bbt/ZXd7aWIv5mesu4HJYgqF6yt7TL50K6j/2+2NYat/G?=
 =?iso-8859-1?Q?Cde2o7JpWDmB/nWA0xMhY2MnaXrdKajOsl/l+ZuWgUBkwl5ZM0z1cBYqnH?=
 =?iso-8859-1?Q?5TWnw3Aegd1vNFYZHIv+Jva/KPvmGLvowpOg8kJG+2hfWdMIdkPSUInoOD?=
 =?iso-8859-1?Q?D5MTMhUpn87GKOCmoSRY7bn1GKZhX0YfZuiWpDqlYsP1sHNgZQSSFAjWuN?=
 =?iso-8859-1?Q?sU1DN3F77NsuQGJjmeA1Oyg/jodgM0ZIFEI6vnO73eGIpg3XqU0nEj8h67?=
 =?iso-8859-1?Q?ke9vFCAHys7hI5KUtMIWOzThzWK8K7kbmeBkK06zDi45A1P+RwpDGZQXuz?=
 =?iso-8859-1?Q?btSbelftmhWIz10gLZaAyk66U7/+AA0DB3?=
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P192MB1503.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a9310579-07c2-4a49-dc37-08da6af40151
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 08:35:45.2741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYB80r43lVc7qvrRt9SNNoNv7DdjgPgrKopzW9TomW+atFzMEZd/dnlYNsv4jmtXXkXRZ9d4iWpzaGnXUp6uDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_013551_937472_69C6E4CF 
X-CRM114-Status: UNSURE (   6.81  )
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

As of today it is known that P2P-Client and P2P-GO are unsupported features of the ath11k driver.
Are we able to tell whether this feature will be implemented in the future? If yes, do we have any information on its development progress and its release date?

Thanks,
Regards,
Antonin

This message contains confidential information and is intended only for the individual(s) addressed in the message. If you aren't the named addressee, you should not disseminate, distribute, or copy this e-mail.

We continuously commit to comply with the applicable data protection laws and ensure fair and transparent processing of your personal data. Please read our privacy statement including an information notice and data protection policy for detailed information on our website.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
