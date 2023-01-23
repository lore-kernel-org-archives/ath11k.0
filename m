Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCEBC05027
	for <ath11k@archiver.kernel.org>; Mon, 23 Jan 2023 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+TEDH9K+ZHb4dQqdMSCvhusrCzijIdA9MJfq0wFleQ=; b=NPY+SBgo3oPYHt
	R1lxYZbtigupVuAYdG7dtH60lkHnyqY0pQTn1d+mzHDJYUZSoPyH3/00TIywxrVfHTXICEip+z2Pc
	TFNiOpYQ1WEatB6JEAw+dhXmOmEC2ZFjwV0C+y9YRBxiMsfhH1ZcD318M4yTDhRr1ZwPVhzod7wau
	zR+y1MkbppheRMML6Etg0sCuIKAZYK1w8q7Js7dawS64u9eNXOFKwfHjYin1TbSi7MIX0L5uLKy4m
	cqlVuJbyZ6Q62ty/BtXqsFIaYBgB8Sg67FUz4pUBJo1Sb+w6VjpR3AgKi4U6FI/6dYSKLu+VcY0Sp
	2CAxPmonAhMRgIeRUOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3gV-001PN8-Q6; Mon, 23 Jan 2023 20:44:55 +0000
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com ([40.107.94.67] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3YE-001LoE-8a; Mon, 23 Jan 2023 20:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAMILjfR3jw5LxsO/E8JO5Y3YrygeGahzm7zvcsdxUGaG7yhFnIcAtSCGJvnj7l2YvraAFtOyV8csOBaFFx7RjQ6ryt40UodawG/bZXg8kCqzWjdPdZxDoyI22K8MVIMDvw6JVdICYqMK2+OaGNCKkaFRGHxI3IalvqdCb1s+8uz5SgdJT1SJec75iEflbQGCVs6iTI1/4kNB0fnZ/DBAZVwielGrol1BAVhCVwXe+sjq43K4g4Twy1oYpQ322CkvGFo5/s9Nqppo2fFKwyNZFOwKIClHrDsTSjUy+p7qpXGFTKOgAqEEyHPQKAnvzXrg4wm6OMQCYIWf9DE2YBNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRK/9A8sRArXPihIPGWjZdUx4J3w0TgqEsUiDMEVH24=;
 b=BSJIPBtLEtakajVbtMS++cQJDissZ8OeVRANuw/yTshPAFjLaQ66bn6goOo8LTF1dc8Fu2MipZd6kpaZ2kr2gPqGX1ak36IhC5OIVuqzzsDG8/dIrQVk3Eag4itszxHhcfneaFNZ7MHMwbj1we0td+0bzLVhNzXay7yl4jGL4XLfr2xR+y64LXSY0Cq537v4ihfU9NqUiS8eA+uYJVwU2podFnpjgYUGD1BhDBpeP2mFn1qGLsSpJGthzOjo0atsFetNAYgfuFJ16E9oddGdZTFbFwokPJFhwJK2ALe1GSaV+7N+ilJc1wbgFOvNbkFzY8hMW+Ay7gItEwM3ednuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRK/9A8sRArXPihIPGWjZdUx4J3w0TgqEsUiDMEVH24=;
 b=MROmOUzQtuf4n+Ejtlos0DORinMwUIldn+q6PhFawtZoZE11fNJukQ/91g1HJROnISqiPgcQRVdlX62p5Vna0U3j9mfLBSgXATr76opPCbChObXIBPUeeK8V2K3CzbJ3bgBJYzlGAujxppfRNG9kZdJ+o427Qr6QfKjj96v1ZoM213Xppv8FBFAW31HwaSyLNo+6eWaV4sRf69nhW5S4Cpumrb9IALTLPF4WuqnMw/CkRSKdwsAMumv/7X+Duu3oQcLY/MrP+48WS1yL7061r7uShmNwfJdQMm1b7rQSH5Q/WZpTjV4tlxTk+SxXKMpZ0uiASfh9Dhsk0+bELAzO2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Mon, 23 Jan
 2023 20:36:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 20:36:07 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lu Baolu <baolu.lu@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v3 08/10] iommu/intel: Use GFP_KERNEL in sleepable contexts
Date: Mon, 23 Jan 2023 16:36:01 -0400
Message-Id: <8-v3-76b587fe28df+6e3-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <0-v3-76b587fe28df+6e3-iommu_map_gfp_jgg@nvidia.com>
References: 
X-ClientProxiedBy: BL1PR13CA0251.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL3PR12MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb985c8-7d6b-4ea8-26e7-08dafd817373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0KJuFjkNJVC29k91ooZqhIJ5ZVWYKrbIEFK5MUtgdjiI0N6Ceeaq1WkgWBHiplAa+beeV3mrLSvwU+1i8TsjnUnTD4wkHvVVjM74gdEwo78VBrMm8YVZePL91LuxqIAIMV5qlaUAzLSV1qGmlNejaLSW3Jh/hwyEtrmryT7sOBi284e9zyVhU5U8i0s0WMf9lij4b3I+8kXWcGY6NOO2E1oXsb3sQofGHHSNqbBvRM/7QMWVittWZcPIYbrTLWvAcdyKdao+TyoB3KtS+uRrdbfy/jmzzIIykFn1VQoEsK1MuWwEqL9igrk/rom2PrJ1qwh/YHU+2rVmn45mCfFsbyuODuLWFKE6PzUVQiHW/fetLSA1wOFYFYkIl9L6LsxTwBJzYwnIQ99sMfAl4XYqFjdP0nigZlUbr6wR3YD++QHBWgD20s0xEYc9htpEDL9OxSRAhKsam6Zi1sgzYdNPNgarMSzCuARO/W6crOREgmroy96IVFuwiSkeVCHsGmaZHseudQgYP9QhZkUN9/XlVUP0SmAGdLrdUBPBtIYZBiC5YWOIOhtz5Y27nYz9uIe3b+1Fc5ZnYhML6qW1yqJB2K6Npo3JlL9VIF24bJO4g+cJRGaWjXheLUzg2HMocZa0Bdp3x53Iwqa5GPgVcaYNRlIl8AbAQYFh7D+GX0Gvv2AsjFtZYHuRqbMkyqdjGAPe
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199015)(5660300002)(316002)(8936002)(7416002)(41300700001)(38100700002)(110136005)(36756003)(186003)(83380400001)(478600001)(6666004)(86362001)(6512007)(6506007)(6486002)(26005)(66476007)(8676002)(66946007)(4326008)(2616005)(54906003)(2906002)(66556008)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?MFO1py3ecyiMRytHx+OCgENOoSRS+xwNk6NtJ9Q/aS746vWkOkaHTTbQ+Xy6?=
 =?us-ascii?Q?jiEVn4+0aaq9y3j6aOhFgnN8RDjkCizFof58rSG4TCMiGrRVvtY0lVJMt1Vd?=
 =?us-ascii?Q?j1S0UmqfMHAkGus5cPJ+fR3NExJ5DZzRQdv8mlmWZ2rDblX86F4SPxN6tggA?=
 =?us-ascii?Q?arrIqHzHw46einWYIvhTrtpvqFxutYSBxm9vScmJRG0xdoZdGGfoAiKZUpYG?=
 =?us-ascii?Q?pmijeVAPNGsq2U5qDipCtYnM3fiGKZq4Ssco9L3ya72v0JYopUUt+jo8XJC2?=
 =?us-ascii?Q?4LUqTrB0E5SNJYqbaFeFUk7QQcOVV59mQKicpnkGVY6xqIZldGjrxB6WCJoI?=
 =?us-ascii?Q?H9UUqfN2355F7ve4+SN0CMZwErTzB8+9hn7HSQOP4cb/Cmv9wqBO4QlFlAxy?=
 =?us-ascii?Q?qkBoZOhF/Hwulb+ws3lK68biTh4+Z02UQvjj1oWW1VKdD3x8z2X2sEipNpOW?=
 =?us-ascii?Q?FVjtVsat20Xmk+qRRoxie7NXnNN4hOiOoGoL3Kh4Ow+28JIe2ewxzPOZVdEz?=
 =?us-ascii?Q?I9SGzbHLYwcBGJwjROuaeD6ClhrdgCbJv9Ch3CP8MzQCfNr7+uzTd68trJF2?=
 =?us-ascii?Q?CSltvpnO86f6d4tpAL1tsJyWUU4uoVvOF3VkGvLlXt94rAFC7YYKNlXyt0UU?=
 =?us-ascii?Q?dkj4OGjcsGi4jFLJdzxShjsQFGR7/oX63R+N0ppNCF3SV8R/P+FHroRjRP96?=
 =?us-ascii?Q?iOjRw1zRaqUYx5t3cH3590URALLigz9/ays6rQOX/xErBES5ZuV3xX+B/oG+?=
 =?us-ascii?Q?TpAfixQf/DXeQfp03mgjYDT/c9chFSXLwBmc05XHVYJKNAzT0g3WXNN7X25S?=
 =?us-ascii?Q?RoYTyvnsmqj7ObAsld0kv2r7iZBNM58mUjWnyYYry2wA8X4cUJODulaGtXRR?=
 =?us-ascii?Q?o8IMfDx9AwlqmNHtWM2BqyT8c2LDe2h+K80z397tSb1WzF7zrUwLvviji/+v?=
 =?us-ascii?Q?tHQk1b/J1ye0TeMj6xMN20KodoqUq6wBV4LJVmzHFe1Lmy7fQkYyoQybCqXT?=
 =?us-ascii?Q?LpdV9xI6zYxjnDAwVC9rb0uJrsj1udgRdkvt5DivtAvB4UGjmnYj5rHxfvdZ?=
 =?us-ascii?Q?bFaTPcWZNy3bKuXqlwKbAKmwA9uSlZ2ZzYBciUELgmnO9pv2HZZPllijtz5F?=
 =?us-ascii?Q?I/Oo693BePYQaEcwnapPT2tYSZHi9jTGx3Nx3J65V+KKmC5l0m4ahOfDBQy+?=
 =?us-ascii?Q?P7zLBp6Fsm3ALplg8G+3nC5KrZ6gmpI+iyf4+ZTg0mA9m7oZ7SIhUAykgG7p?=
 =?us-ascii?Q?kpljamjj8IlbFo7f+iCco3Xj6pwkLrX2SIgOJJ2sHwDN3aVUweRBN5CEJ05+?=
 =?us-ascii?Q?jXzWdvtXf1HQ3Xx8eTHOOgpsQR9GNC0QSeQVZSeBd0WpPlACYyQEhWyYsD/D?=
 =?us-ascii?Q?fnmmC9Sz76/+bX1guTD/cjtuvQ+p7Ev7efxM9lb5LJbvmZC8l+4HYiX5/hWH?=
 =?us-ascii?Q?GxKtfxCOVH9GV3oS9KRf8d3qJaIaZjqBkgXJF3rb/RnMav4SIGkSDLMcFmIb?=
 =?us-ascii?Q?hwGdGYMmTZdywFe2sh3C+dnGEp7kJ1iVVuhtVSe/HsB40VU68LtX5x5vMBMH?=
 =?us-ascii?Q?zXW3Czq6Y5Ijrz3lo050zBdWzcmPIMeBdHZIcmah?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb985c8-7d6b-4ea8-26e7-08dafd817373
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 20:36:05.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rO594qrzNbjVaM0kIvU7UeCPQ27I0Wy8bie2Hw+0U5OlGXQJSob99gE8p5K7ANmj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_123622_366111_B2B987BC 
X-CRM114-Status: UNSURE (   9.12  )
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

These contexts are sleepable, so use the proper annotation. The GFP_ATOMIC
was added mechanically in the prior patches.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/intel/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index e95f7703ce7b83..a1a66798e1f06c 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2372,7 +2372,7 @@ static int iommu_domain_identity_map(struct dmar_domain *domain,
 
 	return __domain_mapping(domain, first_vpfn,
 				first_vpfn, last_vpfn - first_vpfn + 1,
-				DMA_PTE_READ|DMA_PTE_WRITE, GFP_ATOMIC);
+				DMA_PTE_READ|DMA_PTE_WRITE, GFP_KERNEL);
 }
 
 static int md_domain_init(struct dmar_domain *domain, int guest_width);
@@ -2680,7 +2680,7 @@ static int copy_context_table(struct intel_iommu *iommu,
 			if (!old_ce)
 				goto out;
 
-			new_ce = alloc_pgtable_page(iommu->node, GFP_ATOMIC);
+			new_ce = alloc_pgtable_page(iommu->node, GFP_KERNEL);
 			if (!new_ce)
 				goto out_unmap;
 
-- 
2.39.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
