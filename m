Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B4DC77B60
	for <ath11k@archiver.kernel.org>; Fri, 28 Apr 2023 20:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnwqefZsVHO10aETxI6n85n8EUIuwdPD5wxIE35F0+g=; b=H6SkxDwH5OhvUX
	49fhchR6TiEwFmS37usgJEhpVxpMXZKOj8gFGB9L+JLnuspCYMwLi3NZALVuZELUG0r7FCKjaJroh
	zXLEd546OM1Ap4ZNZdVkjXDM2y4R159opo/aSN5QLueq5YHMg76M0z4DXJGpY9jDVzk8otz8630Sr
	Xz1EZeoybTQzvcaKS7RhPNIiTqOoUKwdfF5OQg6z73onwVSwcqDLuRwlg2AjZIkfgECwiJHY0mVgl
	p3uRzdk0OwKKdiHWrth4jKmcF6BmAPifJgL8On2VFtxJ5p6/Vt3bBP5TMzmgL2XbavwlZIsvBKwWj
	k73y0obnF5FsuTyL4phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUap-00Bj7J-2v;
	Fri, 28 Apr 2023 20:21:23 +0000
Received: from mail-dm6nam12on20707.outbound.protection.outlook.com ([2a01:111:f400:fe59::707] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUan-00Bj6S-1K
	for ath11k@lists.infradead.org;
	Fri, 28 Apr 2023 20:21:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkKxWPfQEx7gLewLqVKTN24XUHSAHQAIIC0fpofMBHEOrZYrNrKIew26tVB6XlkvVlBOIPsAk+Sd8UyBArmI6oMPQpUEUaRUwjZ4sFPBKyVRo/0rR+MZIoGHOyDCeVJhnp5OgB+SDItyi/Ni5OMoX0eO4bXLuPRP/8jcw1nT293m2rxCS3uzLnEpHE3SvUkt6Zu3WJ0gWbCQHb1Vhgjlug9JjyjTMoXNTL59eEmRf7cxb72QWp9T9Mbn/TvuagsAchOgLTnQ6S4mc4ipqp/dh3wJgAog5JvYkgpnowasvp/hIplBSOebRbfUIcmN3rUaY3x4gGQsj8J9rdoFmpshrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtNeKrUgHWgybUZiwFn9ZUfLZPf1mFcItNAAG+dA7hk=;
 b=dpMVVlZIcRmccmfiJgTr6bHlHKiTsntVmP8p8/GkXFU5SL2YFEj49B8xGBCYltLjn3wS//rrE740ShQJGbJcO20nQBqG5R4UvRca/oWA3wctKqZzMHHrUSZ6eAuMNhxu7+odlMI8D3QoDH9abj9SoLLScRVvRIYPMUXI/cOK/1Ia/JReVzqJIV/zJPvpCWISfgRsbQbWsphpAwCt7CPEhQ8qkDLUomG1PDRU1KMCxd27ehVmvDjg9LyM4AewcOjFegwHvYi7fVr//Yqqz9aEQ4wxVSuOfntPutxS8OX72EYemL3mXNu//4lyotPL5oGUi8yFL40EWtK1Z1yGnX+Khg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtNeKrUgHWgybUZiwFn9ZUfLZPf1mFcItNAAG+dA7hk=;
 b=Mkgog0ehn9Aau+MxIt/2tQ+I8n+/oV7VCUl//1iyhpC8CoCnZ5mlerGxpzgZCK0PZS6ixLpBG6rkW2Dhg5moK+04DQv3bomeL4eQzYLKh2rKzX/IXYKmfGaeA19Z38zuB6xEdVyIo06yb7pInKbVuOHAAm+nut9IZJG5Z4vuYqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by BLAPR13MB4675.namprd13.prod.outlook.com (2603:10b6:208:321::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 20:21:15 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34%5]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 20:21:15 +0000
Date: Fri, 28 Apr 2023 22:21:07 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
Message-ID: <ZEwqs0B9FSarvYS6@corigine.com>
References: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
Content-Disposition: inline
In-Reply-To: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
X-ClientProxiedBy: AS4P251CA0029.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::19) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|BLAPR13MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5094f4-aafa-48de-027c-08db48261dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VjM/JXx14lSGvdZA807urD+wP0UqxfHJQkbppjjLUtjsfxE3gfhk5/gSrL0GZ/IvmLwn9cVGndSKXVsdJfkzO3ILWncR6f9NwoehJTucsJcENYchJGpl4DKTz7jFhsQzbzCxS7ELF0pFlNQhjJ0kgujvXxnCoSryolxxPsW5SF0XuDPazU0bv9PyKActrx/8ub5RDXFY+vUwdYBEY4VXV2g/+1Hnb3+vCRv48Jh9klOlkITqk4oqIdXPe70GJclS/lN5nlOIgO6T0WHWjR2uFmecNOpJgJswak0kFetU0UwonewJcKpq+PCzUCrdY0Hz/HFYwQnzymQH0er++olFz3wQXfBMQauLNmvfJDqckw88wegGv+kgQLsjXtq/XQQVZqjDdc1rMLQthEf25zRR5X2NJxeQlzZGWwM6HNMp6JeOEGez+jWtWYZ5WGrau3PnSaf3unQY9cOIzMgolb7B9islzBG3cm+SrcCk67UptGsxvVFt+KWLHV7uazcHNIfKrl5qFs41+RCLrHxZaCs/GCfpyIu6JHOhGGwBfMXj/CW6OmcHhZzJPDOmq5hLYNVR
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(376002)(366004)(136003)(346002)(396003)(451199021)(186003)(6512007)(6506007)(2616005)(66476007)(44832011)(66946007)(6916009)(66556008)(7416002)(316002)(41300700001)(38100700002)(5660300002)(4744005)(4326008)(2906002)(86362001)(54906003)(478600001)(8936002)(6666004)(8676002)(6486002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?KZRZdbQH3vaTK6Yab+jIUvny66vZkD+xK34jdIK3FBTuY29GdMWDTGe2pO4q?=
 =?us-ascii?Q?fyPHA2/L/SAEeQp7Rfuo70IYVlhUMx+FU6eXdNnZ4AsjWnq7ltcK1p3xFPbS?=
 =?us-ascii?Q?2Q7r4xDEiavYyZyim4Hq45v1j6rML/xxvObkLnCn8HqTTgEHyJAjWTitZeqO?=
 =?us-ascii?Q?D7zLs/KcwEOGpEf8S2lSWxEq/p4u68K8PUqQtnfZ8vru76AtAlMam7ahp9vT?=
 =?us-ascii?Q?KyzqHkBoHH6axxxJ+pZri1+iphykBLQU/9TCoYD1yGeYQl4V4fSkGAH2T65n?=
 =?us-ascii?Q?x8kGq4VePlryfKRQS6yiTbW+1pdU8sisbVfwKipVgbC26hPJG32+hTn/EmHs?=
 =?us-ascii?Q?k3P5l6+tAMN9ue2IarhMpiWAuxeYjpHqpQ0oV/a3wLcXBWdJG/MJVQeTno2J?=
 =?us-ascii?Q?oT7WiuhUojx42YB7aSdc2jBg3Bz+UNd9xXl+68Ga69Op5w7Pc6xvZz46hk++?=
 =?us-ascii?Q?UWwmc4Jsg2QUqQsFECjFuCBsRHuYSA85UmIx/WimnAknm2O5k3mInqBGG5oU?=
 =?us-ascii?Q?ljwB6IpiFWKP7fftjYdosPk6igLzHoaCMCxBDbzwZMFfM6x3Xk6C065S07Rl?=
 =?us-ascii?Q?PFw+HnsJ5SfoRQB2lj/NbcwqXpsImms1Bhg06ZbEsa5I/uklunRBY6QhFOI8?=
 =?us-ascii?Q?T/NEFRE0vVpexRI8q3CJOZP+x1OuxyqYdd6QBSkMxDCa7MNANMEp6QecwLf7?=
 =?us-ascii?Q?LxdPtrBWcks69SeQ5VYxlfofdAd0HwxseGcSOva22ZGHVupO6H5bxSSFFkEV?=
 =?us-ascii?Q?tK292Nb/6PfgV8cFdVNXacanZ/JNmpEnW7Doun1CMi8hcvtyPKwjPjjltYM4?=
 =?us-ascii?Q?g+IvAc50E/ztDHd7WKy4q6dsRgV0u6eXTve4ReiYfCBuR8uhHBhaRtAMLQZl?=
 =?us-ascii?Q?bjQfNQkSeY8lfQT4W/nw6Y+2hwWfw9hEOICspcbUufdCq8Ug6iJ34wf6y3de?=
 =?us-ascii?Q?P2vh5pJrmwy1x1KU5eGmPBMO4h9TypSS9DjaFbV2noQNealxwc0hZ7yvdbdd?=
 =?us-ascii?Q?TYGPCWT1oN91vt/zLU0jBJgoErtcV0C/iJ/wWqXwFvnaB36LAX6QQViVFo1M?=
 =?us-ascii?Q?p7cbJqiKcyzjr35xd/4/U+++wQFe8YMVtiifSYe0jTbaSE7CVTLFc52bxfS6?=
 =?us-ascii?Q?4qt3BdtibHxNDHxfmVYWvEJsdReAiJWwfNt7pV3GD5Rb7UoYTeYirxhpw/Oe?=
 =?us-ascii?Q?C4+HmmCkJj26CB3wwxQ2iUNu05pTK/D1xdl9ABXlmxqh1eTYlBwb8kT2FQgK?=
 =?us-ascii?Q?KPFYZmQuKwvjlYg0NFGGkoUvuDAA3iDNmYYMfde38mPuYK2EuQdZpvO/dh7Y?=
 =?us-ascii?Q?O/pH494o0w4GVBL5Qjp8qi89C6+9Mmbol0JpcPuTOV89X+X1FZzlTftj7h5X?=
 =?us-ascii?Q?hO17lBhXP4bukR60gnOAonZKLHAk+Ef55/J65mpq9YO6G/MExV3TNt879qz9?=
 =?us-ascii?Q?LKnlr00eqGwbEy99Ze9YKQV/uGPiPNC1KV6OLUnNFq0dhlMdVgI+iLnPv0nw?=
 =?us-ascii?Q?NPkvgqlD1vC4VjTPXAJOIFlVKSUKyvTJg5Vgw5QtmVc4oWC/hlcQXlfsZQ+v?=
 =?us-ascii?Q?KCyqK1rnDoNr9oxbaxe5vXrdpKSP3ykOB/Ec1I9BQ2M9zqZ5gfYhVmB+dcK7?=
 =?us-ascii?Q?9QPjzwidn3MQ+oIGHBghMQOu37dDiuhQb9QdOxj1Eg8svDlbqXkHWYDoAKBY?=
 =?us-ascii?Q?vl1lQA=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5094f4-aafa-48de-027c-08db48261dfe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 20:21:15.3698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34zwtlkeyK24Y8+7caO3KN9DUB395jFAC+5lRYmtoiaXf5N5YpPlwkU+AHvqOPYDrBKo+slPsOZRA1I4tqwsdndubXpXY8Xk4FnC76X/K1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR13MB4675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_132121_456763_4DA19526 
X-CRM114-Status: GOOD (  10.98  )
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

On Wed, Apr 26, 2023 at 10:48:59PM +0200, Christophe JAILLET wrote:
> ath11k_wmi_fw_stats_num_vdevs() and ath11k_wmi_fw_stats_num_bcn() really
> look the same as list_count_nodes(), so use the latter instead of hand
> writing it.
> 
> The first ones use list_for_each_entry() and the other list_for_each(), but
> they both count the number of nodes in the list.
> 
> While at it, also remove to prototypes of non-existent functions.
> Based on the names and prototypes, it is likely that they should be
> equivalent to list_count_nodes().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Simon Horman <simon.horman@corigine.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
