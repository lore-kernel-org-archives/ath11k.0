Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12F4C001B0
	for <ath11k@archiver.kernel.org>; Wed,  9 Aug 2023 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25WZrXKKqZvOx2nn6hR/98CeS/UTgn+1R+Uq3N/7tM4=; b=es1jnlD8CGhD8Q
	5xiZYpAUIa6mW0wxi5BSCMj+NCl2qTa4gG1EkIJjudgjmPiNNPSVVRzX/pKJ2OloqYkJEk1OCYM5N
	2YK1jHNto76SjIvK34h8Lx5pnQFpdhZ2CcvRTUtKgU2tNcGPUEE8zilqrlFwAM+TBm3Ri4uUjUF7f
	65T6YGI9/V2U2yQ3vqvT6l9bTMPsmT+hyp+he7LP7ff+4meGmArCq6/p4DeA+pZ5JlknsrFFbBLkU
	TMQQVrQBOgEMsXB4gzkYlGwgD0QB/eAW+YzBxOA0b5iNasQmRXKQBUCW5rM/gtpguDlaUgGX7vPU9
	aIbHy5mmTc/SdQpSAs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTf5p-004QSl-2W;
	Wed, 09 Aug 2023 09:03:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTf5m-004QRw-0l
	for ath11k@lists.infradead.org;
	Wed, 09 Aug 2023 09:02:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37990QBt002136;
	Wed, 9 Aug 2023 09:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=APN9R81y1vkzZ+bon6ieesrBDLEA2EFWpxUvuuoF+0E=;
 b=MeL0oUWa+w34dUaK4XODCPFKM9LHZg178MZjPkEwqzLNTpmLnMZ5aYiHLePNMA73lnPw
 EekK4UpHgPuXf+mhOd3v6WdE7vZSYNo2G4QLU1JA3JfhuYsZfVATWBXV/+loRlUchKRg
 Lp0WDBrS+/f//8VkS+nZyILhCn5EvIrdcY4v7ZcgMt8uIwYB70pQCoRbzV0UtJIG935D
 BaVpK88LOdsTsedhQbs+qmRKCAUB7u0UMVHLWsVlmVQYfsmQKc3dp2tvnoL9XaBwBNDb
 uyU2OzVKpTuXbD1eEma4ayUSgkQPKXCyWi+NrA+zuAoTXje+1szuZH23codLk8zX/WVj 5A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc0050wv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 09:02:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37992h3V026256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 09:02:43 GMT
Received: from [10.204.118.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 02:02:40 -0700
Message-ID: <42f78c02-1ddc-cf1c-694f-abf9059dfb60@quicinc.com>
Date: Wed, 9 Aug 2023 14:32:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>,
        Bjorn Andersson
	<quic_bjorande@quicinc.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230809073432.4193-1-johan+linaro@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <20230809073432.4193-1-johan+linaro@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uzOrskq2NaRDOacIBiyeeIdxixkzHzf-
X-Proofpoint-GUID: uzOrskq2NaRDOacIBiyeeIdxixkzHzf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_07,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 adultscore=0 phishscore=0 clxscore=1011
 mlxlogscore=780 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_020258_312002_440BF30F 
X-CRM114-Status: GOOD (  12.05  )
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

On 8/9/2023 1:04 PM, Johan Hovold wrote:
> This reverts commit d265ebe41c911314bd273c218a37088835959fa1.
> 
> Disabling threaded NAPI causes the Lenovo ThinkPad X13s to hang (e.g. no
> more interrupts received) almost immediately during RX.
> 
> Apparently something broke since commit 13aa2fb692d3 ("wifi: ath11k:
> Enable threaded NAPI") so that a simple revert is no longer possible.
> 

This is getting as weird as it would get :)

> As commit d265ebe41c91 ("Revert "wifi: ath11k: Enable threaded NAPI"")
> does not address the underlying issue reported with QCN9074, it seems we
> need to reenable threaded NAPI before fixing both bugs properly.
> 

It seems that the revert has actually solved the issue reported with 
QCN9074.

https://bugzilla.kernel.org/show_bug.cgi?id=217536

We were trying to reproduce the problem on X86+QCN9074 (with threaded 
NAPI) from quite some time, but there is no repro yet.

Actually, enabling/disabling threaded NAPI is a simple affair; I'm 
wondering to hear that interrupts are blocked due  to not having 
threaded NAPI.

What is the chip that Lenovo Thinkpad X13s is having?

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
