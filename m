Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1718BCDB482
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAToBvJw8nlPoL77sZ+sbjGDtH2UWLDzTzpLr/cYZFI=; b=xj04za/P81ncXb
	Zy4M1XDkWWLY/49KF2Kym5w4GlYnRGCGIkgpabM5saXsY7Jqluzq7X4+HI5TElD8P6E54ep8VQ0uh
	KU2Ap2oSN5NEJIuhYpvsrY0J/Bgf1OX1fJ3tY0COSnlOmYr4KIs1H+gZGH24zzpQRj8lx1kmJVAi8
	B/zg0+esYm5C9FIDAhv6oz5bqyVsKB+wVTgGJ/GIne4mn9ksNFZQFImYG4GsAIS7glENVOOGZPeJF
	Ct/txsjjq1zGk5XtoqPU4oS5vnqwtu+jntgBbnJv1EKphoR7EVOy6GnDjQvRBAsWR+Y2FGI4Wz3rN
	Af5A6ffM9HXVyy5tR4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUqn-000Bb7-2F;
	Thu, 19 Oct 2023 15:22:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUql-000Bah-15
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:22:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JERbDc005020;
	Thu, 19 Oct 2023 15:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0v2LvWG1tVNrZ6aUGcIw7ZwbbjE/fboEMBfgC/plseQ=;
 b=lgiPLyIx8LcIdxy4/Z56HVuKnBQEITyMdd2tYBjq3F0t9VafBnbGvP7HIuKiRux2UFBg
 R+WCa1eWGtDkyBl0yx9ie4vP1SSel7mHTjuUacGL8nlRwvSS/C5UOPRXp9HzggHsX9PK
 qQq62mInG22h0JveXZTlm/OpPGppyRa1fNhw1JJiw1/E/OwpgZ56PA1R2pppUFQc9xJK
 Kdn+hLyASnArIieYfjjvpWksy+dGQImAb3vIUhk/pkJYoBjLO/j1faUlsxpzcaiv4xFc
 y0JwUC6+ZFz7Y2s9IVLY6FtWZfK+6ERv+IzAEl6Dh32yUe5UxsCOE/uP3ZBa/MBAXak7 ww== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu67jr441-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:22:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JFM9pN010981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:22:10 GMT
Received: from [10.48.241.70] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 08:22:09 -0700
Message-ID: <626763fa-4691-4e81-9afb-77f60b017d74@quicinc.com>
Date: Thu, 19 Oct 2023 08:22:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath11k: add firmware-2.bin support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <mhi@lists.linux.dev>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20230727100430.3603551-1-kvalo@kernel.org>
 <20230727100430.3603551-4-kvalo@kernel.org>
 <563e8d01-beba-bff2-54e0-7629c462add0@quicinc.com>
 <87leby2152.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87leby2152.fsf@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZNFuLNRZZ-m0d71pHTZpO9m-B6aQhZDL
X-Proofpoint-ORIG-GUID: ZNFuLNRZZ-m0d71pHTZpO9m-B6aQhZDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_14,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=552 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_082215_488606_7979D9E0 
X-CRM114-Status: UNSURE (   8.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/19/2023 6:27 AM, Kalle Valo wrote:
> Here's the updated commit in pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=96e0d3887f65eaac7745ff9da7c89f0c59bb347d
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
