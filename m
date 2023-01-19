Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD425C004D4
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 21:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jaREwuu27CvdsPhSmpOvks8Eqo9BMobmpQRExTeoBHE=; b=iLpTRX7hYHMT8T
	qV62f2YgHjrGpM8Jd9LCsPeWYe4h6YdKgZy6beRuawAn4apgT7zYWysOQCDiQFCOf1mDeZtrUP2nL
	qLDwW2JfssQmTAK8TryAfnDqQk0ytM5czmU2FWCBpevv4SlAMhE2IGWC+zr4ydDFfOIAqP/hDYPrd
	VV+LqzvqfFJP7n37tT6sHxbpfTEt3zU2DA89ajQ/afIRQt7LA71sYb30abAP0nfQ4rkBHbrOyWbzq
	JflegwXlhsLzsol1b9B69E+yJjXp6rpJzXWydXmVhyI+vJ53r9N+moG7OtOEe6sse6jTrnUnp5ub6
	7kzwuGc5mxqw3nIZ9clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIcuR-007Mc6-1E; Thu, 19 Jan 2023 21:57:23 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIcu8-007MWo-6u; Thu, 19 Jan 2023 21:57:05 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JLlbHM030199;
	Thu, 19 Jan 2023 21:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uEw62BCO1kAE3MnqsTANbbpQMbTsLDdWyYH4p4E1DCA=;
 b=JeBeAbeePVqEpUQNApMZ8YIYEPuLwCZ2G/HwUA0cmJLkPk7ui0A5vQFQYJEVqdVbML5U
 e91pt5oFbU7tm1Nh7A8SxsxN045+sZTvEQ5k8ODQuVBWfdMnWWEOx2plljcn1hE/uFx1
 3c3qdPwGLHTfGV+Xj1XOZLv9pGhrORCY0KStHgA+e6dM1txf3fJgNK7v77HTGl6GazGJ
 vDcd9/OoOTa4KBu/a3iDR5icyiDw5I5jPYFd9BbKlvc9N3qsIOsgjCHSEzgOptqfLcJ/
 HoXfR0nLDnjtgu6JzBG5EYU4milBxTfxfY0/ItTN9LsByz11xbMq6hTzsAZfSsNbZ4cY 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7e3d866k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 21:56:56 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JLuu21027289;
	Thu, 19 Jan 2023 21:56:56 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7e3d8667-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 21:56:56 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JJkuri025991;
	Thu, 19 Jan 2023 21:56:54 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3n3m18897y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 21:56:54 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30JLuqn966453836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jan 2023 21:56:52 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66B7458059;
	Thu, 19 Jan 2023 21:56:52 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9964F5805B;
	Thu, 19 Jan 2023 21:56:49 +0000 (GMT)
Received: from [9.160.87.67] (unknown [9.160.87.67])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Jan 2023 21:56:49 +0000 (GMT)
Message-ID: <1c7a7395-dabf-ddbf-00eb-9e7e44910750@linux.ibm.com>
Date: Thu, 19 Jan 2023 16:56:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/10] iommu/s390: Use GFP_KERNEL in sleepable contexts
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, nouveau@lists.freedesktop.org,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        virtualization@lists.linux-foundation.org
References: <10-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <10-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u9tb2Epyw4L_fk2u2w9vs35Q310gGVQW
X-Proofpoint-ORIG-GUID: CtIEVTzNTPEu57hDSdzSORw4_xg43p3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_14,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=773 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_135704_367680_BD57D055 
X-CRM114-Status: GOOD (  15.27  )
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

On 1/18/23 1:00 PM, Jason Gunthorpe wrote:
> These contexts are sleepable, so use the proper annotation. The GFP_ATOMIC
> was added mechanically in the prior patches.
> 
> Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/s390/pci/pci_dma.c    | 2 +-
>  drivers/iommu/s390-iommu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
