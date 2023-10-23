Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E85CC25B46
	for <ath11k@archiver.kernel.org>; Mon, 23 Oct 2023 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLGBxEKdjFdVW3LYD6Ck+KIrwIs5q/DZcTC+gsUrHjo=; b=rT50c9OyTTCusX
	rnPlwKExrLu9mXMirGRO0tVheVAiz5IcvqlpjPQPyIXcetIyHO9UeMLEeCn2NGblvd5+jLaB8Aabk
	7fdQzMaCiTEd5iJHX9wfATn+/i/N8t/HROLN9J//1gGnMDmh9ryOtZkSk4Krlcu2who9/YN1vyCeu
	m8oKuC3cYFdr195oQ8ZBmm41FWIvzACVsZAbft0zvNFI7mQWRxkMKz+F3UIHjbBH+1u2YFrPhUWjK
	syb+FKTY0be2GWfaA6/EEhtHEMpArFd8D3WT5iNqKYEaEy8/lc9AbwBE9WVOzpujjUwCEF3VcoAsK
	JFXsjJTOvaq7B0E4F12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyhn-007vrs-0n;
	Mon, 23 Oct 2023 17:27:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyhk-007vqx-1q
	for ath11k@lists.infradead.org;
	Mon, 23 Oct 2023 17:27:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39NHBnb1029945;
	Mon, 23 Oct 2023 17:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bmYeSuq9Pl4hgh2+FWj/C9H9eXBCmChFtA5fFMXFvQw=;
 b=Bv7ycVlGV2ZpgffQwVfBWP9BFmV+iYxfPM2R5ICQLFnedLBO+f1ohmkNCPixCygMStJ0
 +J80EC/nWeDUGwlfyvYOLtQpBl+s44rNYnD7ISmD4YXiI4a+YtQE2fxe5iVoP6psMwu+
 hODLeecGrO1cl9aPwJHKylrPTk0lZH5k1WD2SYX9f7goxz3/qbbGe5HLSVhOj7gJ7AIF
 hcM43bfkHSHuy4TV+1FrF9ce/cMcZ69i7uz3qNG8K09vQKGsXddiMEG95uPvxgORM8YV
 6d33SBT1mPUY0Tvdw+5NDxBxSGRpTUIUq8/xvsNwsMn34wa24uoafutqtDNtaLouYbjL Fg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tv5yr4qdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Oct 2023 17:26:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39NHQvM8009329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Oct 2023 17:26:57 GMT
Received: from [10.48.243.236] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 23 Oct
 2023 10:26:57 -0700
Message-ID: <637ccd71-e7ce-45e9-ae39-45419956e727@quicinc.com>
Date: Mon, 23 Oct 2023 10:26:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "wifi: ath11k: call ath11k_mac_fils_discovery()
 without condition"
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231023164120.651151-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231023164120.651151-1-kvalo@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vSZl0rtul663LuUPAT1R4GH1arLRrU9_
X-Proofpoint-GUID: vSZl0rtul663LuUPAT1R4GH1arLRrU9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_16,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=592
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310230152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_102704_741248_4AC2904D 
X-CRM114-Status: UNSURE (   8.96  )
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

On 10/23/2023 9:41 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> This reverts commit e149353e6562f3e3246f75dfc4cca6a0cc5b4efc. The commit caused
> QCA6390 hw2.0 firmware WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1 to crash
> during disconnect:
> 
> [71990.787525] ath11k_pci 0000:72:00.0: firmware crashed: MHI_CB_EE_RDDM
> 
> Closes: https://lore.kernel.org/all/87edhu3550.fsf@kernel.org/
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
