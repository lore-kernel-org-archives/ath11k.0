Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7416EC77B7C
	for <ath11k@archiver.kernel.org>; Thu, 11 May 2023 10:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xBmlALJpaqZu6+7t62vQcgdFSRHZW5gwuHI7cUHlPo=; b=rQXREMcZUyETnh
	8op9+Cdb/6/XaK3+ZJD8pTh8T+0v2W7di8nxJ4azyHoZ60nBQvsuek4mKN9V2woX5vE95zLORkS4u
	sU9GnUgDYq+5nZC1mE8A16mFBDNsF+n6lPtb8peNAEax7JbGcWDitgOwsYVizlh4d27YDCWH7LzwC
	LwXe7NPG0zThqAse5Lf+a+2ok4n6Y9sKzedFcXyDM4H8WwRWxbUQoNnRZKNGRiTWp8dOyIu286RKF
	c6HljxK5vvJCN7R8gP3klgqHKfzhNgky+1amFIW2kw0t/wypy5zCr6Zwm4mSytY115Hh36YY7cA4y
	BMK003Rc2ce7rJNkH32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px3Kk-008QL7-36;
	Thu, 11 May 2023 10:15:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px3Kh-008QJx-1r
	for ath11k@lists.infradead.org;
	Thu, 11 May 2023 10:15:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34B8EN91021129;
	Thu, 11 May 2023 10:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3dcVaqAB/bdugJEpbEzzQDKLrrtwmbvcyw9R2s1UEIg=;
 b=Xe0o68WFffKTBaQOisXPdgWpifTm3ELPPmJE8kZUVO9rXjigqUnXPUHioYotXa38GYqn
 Df7xXV2HIz3iw3CPvnX7v5nqmdq9GBB3WjITm6lmWh5eaidZe0nH0LpDtgdZQoNgXbop
 wKhIgjzqUvzLzyf/pW6J3CLyAeQw6znqr+hUJs3wtnsL/Lmkj+fE4/zXp3UAXC5iCD3Z
 sX/nFx6lrBsFC7WB+CMdQ+J//8a6WC9rFK9vlcR5J0lUIPWkX+zpEcKTlUqxtRvEGu3h
 7vga3J0mbGlCiIHxXqOdKWclJQ+2jHr1IQJzshBPa4RM7p36tP54UHgXniRLYqzh0br7 bQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgv1t8bde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 10:15:26 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34BAFQJ3004987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 10:15:26 GMT
Received: from [10.201.192.62] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 11 May
 2023 03:15:24 -0700
Message-ID: <dd5c9dfb-519f-0d64-72a8-50f72f7a9998@quicinc.com>
Date: Thu, 11 May 2023 15:45:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] ath11k: Relocate the func
 ath11k_mac_bitrate_mask_num_ht_rates() and change hweight16 to hweight8
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230504092033.3542456-2-quic_mkenna@quicinc.com>
 <a409ded2-f6e5-bc74-3fdb-231a92d9bde5@quicinc.com>
 <877ctfnpnb.fsf@kernel.org>
Content-Language: en-US
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
In-Reply-To: <877ctfnpnb.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NjNlN1IH-OIivDoucrgD9d4_WpM6esyR
X-Proofpoint-GUID: NjNlN1IH-OIivDoucrgD9d4_WpM6esyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=858 malwarescore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_031535_632610_C7DFDC5B 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 5/11/2023 3:41 PM, Kalle Valo wrote:
> Maharaja Kennadyrajan <quic_mkenna@quicinc.com> writes:
>
>> Ignore this patchset, I have sent the v2 version of this patchset by
>> rebasing it on latest TOT.
> Why? I had already applied v1 to the pending branch without issues:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e3fd9d322448ee29c65a30e9bedaed222d7548b9
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=b7c3ee0ddc2bf3ecf511793aa55622a9aa62e420
>
> Is there a reason why I should take v2 instead?
[Maha]: No change in v2. As the cover letter of v1 patch was not sent 
along with with v1 patches, cover letter mail didn't link to the patches 
mail in the patchwork. Hence, sent v2 patch.
Please proceed with v1 patch if it is already in progress.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
