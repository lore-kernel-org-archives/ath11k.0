Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EC5C25B75
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 22:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4QY+F1FJbsM/wDJgEBzeFcAgoh0auxhIr9S0zEFsxk=; b=WSc/IYAtcNPCbNun2cOxBvJoXV
	dfojeFG7hOK3XSLiaSE4UEWSbzu40i7/cnc548Ni8jXuzJQ7DIUFKj/j6LmizIRMaI+o1EmbDdA50
	EUxiN14mKzzOlg1hgWdLkAQdW7dOWW/HlPgd5kAzvRf4rePphGTYtywkkmEyCOr2HmFDvHOTUAvjy
	awqh48PB2Lonl8lPuhcIc7U28B1bexsCg3G8FGgLNh9FQjtMyrikXb6IQ60dUb+1o6krAUuhVSvSR
	P05uLnvILGhc50Kru0xIh10RXwZTddOzL4D4tlEMQVTNWQ4O96QjB8ISQehbQd4v+vbINi951ZzR8
	H0TywoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGcZ-00000000Z3N-2i0V;
	Mon, 03 Jun 2024 22:57:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGcW-00000000Z1S-2JrW
	for ath11k@lists.infradead.org;
	Mon, 03 Jun 2024 22:57:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453Bl8qM017816;
	Mon, 3 Jun 2024 22:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4QY+F1FJbsM/wDJgEBzeFcAgoh0auxhIr9S0zEFsxk=; b=YYZMFLwxjWhT35F6
	YBOKzW3GwNCoPchaIgQN2YgatIGOBj7Y3CFIM/b53d0mzsEQz9Mpw7jdAoAJ1I/F
	IYilULFa9UP9NWGIPE3i3YVt/WYMvx2vjWPyysVvOTkIRB/PmgEQ7SKDypuJ7Cp5
	Zr5dYxXrL3Xo258U2toVn/U8G7MJhlahlEFj9U8UjCVxZ3yf/fplopQPqjLj0lqb
	0uPCYgzj2aD1o95bn3d7B2fdqWj5wtXr5eMbixFMlCJhQMUzLVngvX+snstvWrho
	MZfUgCUEw95C97gqLJJpI0uNPABKiKrFFSwefio/9Q62DJj/5dJxsto907NGBgav
	dCZ1Eg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw3r5e1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:57:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453MvZjH001996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 22:57:35 GMT
Received: from [10.48.241.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 15:57:28 -0700
Message-ID: <47cc9455-6efb-4b1c-8743-c992e502633d@quicinc.com>
Date: Mon, 3 Jun 2024 15:57:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] wifi: ath11k: use 'time_left' variable with
 wait_event_timeout()
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-kernel@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <20240603091541.8367-1-wsa+renesas@sang-engineering.com>
 <20240603091541.8367-2-wsa+renesas@sang-engineering.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240603091541.8367-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gFeYGuRClnezr6hNISr4C3GIahKB3ZbI
X-Proofpoint-GUID: gFeYGuRClnezr6hNISr4C3GIahKB3ZbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_155740_830131_7DBA44E2 
X-CRM114-Status: GOOD (  20.35  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 6/3/2024 2:15 AM, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_event_timeout() causing patterns like:
> 
> 	timeout = wait_event_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index d4a243b64f6c..2fe0ef660456 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2859,7 +2859,7 @@ int ath11k_qmi_firmware_start(struct ath11k_base *ab,
>  
>  int ath11k_qmi_fwreset_from_cold_boot(struct ath11k_base *ab)
>  {
> -	int timeout;
> +	long time_left;
>  
>  	if (!ath11k_core_coldboot_cal_support(ab) ||
>  	    ab->hw_params.cbcal_restart_fw == 0)
> @@ -2867,11 +2867,11 @@ int ath11k_qmi_fwreset_from_cold_boot(struct ath11k_base *ab)
>  
>  	ath11k_dbg(ab, ATH11K_DBG_QMI, "wait for cold boot done\n");
>  
> -	timeout = wait_event_timeout(ab->qmi.cold_boot_waitq,
> -				     (ab->qmi.cal_done == 1),
> -				     ATH11K_COLD_BOOT_FW_RESET_DELAY);
> +	time_left = wait_event_timeout(ab->qmi.cold_boot_waitq,
> +				       (ab->qmi.cal_done == 1),
> +				       ATH11K_COLD_BOOT_FW_RESET_DELAY);
>  
> -	if (timeout <= 0) {
> +	if (time_left <= 0) {
>  		ath11k_warn(ab, "Coldboot Calibration timed out\n");
>  		return -ETIMEDOUT;
>  	}
> @@ -2886,7 +2886,7 @@ EXPORT_SYMBOL(ath11k_qmi_fwreset_from_cold_boot);
>  
>  static int ath11k_qmi_process_coldboot_calibration(struct ath11k_base *ab)
>  {
> -	int timeout;
> +	long time_left;
>  	int ret;
>  
>  	ret = ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_COLD_BOOT);
> @@ -2897,10 +2897,10 @@ static int ath11k_qmi_process_coldboot_calibration(struct ath11k_base *ab)
>  
>  	ath11k_dbg(ab, ATH11K_DBG_QMI, "Coldboot calibration wait started\n");
>  
> -	timeout = wait_event_timeout(ab->qmi.cold_boot_waitq,
> -				     (ab->qmi.cal_done  == 1),
> -				     ATH11K_COLD_BOOT_FW_RESET_DELAY);
> -	if (timeout <= 0) {
> +	time_left = wait_event_timeout(ab->qmi.cold_boot_waitq,
> +				       (ab->qmi.cal_done  == 1),
> +				       ATH11K_COLD_BOOT_FW_RESET_DELAY);
> +	if (time_left <= 0) {
>  		ath11k_warn(ab, "coldboot calibration timed out\n");
>  		return 0;
>  	}

This looks ok to me, but note that changes to ath11k go through the ath tree,
so, unless Kalle has a different opinion, this should be submitted separately
from changes that go through the wireless tree.

