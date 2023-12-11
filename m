Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5092FC4332F
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giOMIbMKEaxqk3f3kdfFyOiM8WWT2/mEt+jpAZjlqEI=; b=0NyR1LfVV1whhKFWLabQY7XdfU
	KtzzYYd9YXimCcdYlP/hKpPvRKoiWcecjReFaaqWfhJEPRIdYTXJ9Juy2dttCOFmnfQX7wWHhz/CB
	U83Pdenf3dXWE9P1RLeh6uobezfSADK3o62mrz+mZVyVF8wRjCpdYNfwBnKm2uQ1eyR0ctvxhl+Gg
	ijtRiqEnEyDqHufJNEnQw7/sWob6hgGTuZMO0RSzG34PGTdS2n5ir1qBmmQq0APQBuNTz9VdZYxGK
	WJaO0+saNmHLlKEopfeH6dqX3VT/UEX+ATHICIhJZAyblUUdYG6//86SWZF6o3Shck58W6Iz9GmfB
	zL09Yu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCoGV-008sfI-33;
	Mon, 11 Dec 2023 21:56:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCoGS-008sdN-3A
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 21:56:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBLX1jb009613;
	Mon, 11 Dec 2023 21:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=giOMIbMKEaxqk3f3kdfFyOiM8WWT2/mEt+jpAZjlqEI=; b=BK
	a+p9zhnBhHWKZ2BwSKbnAkQ7+phX/bKXXV3dhbI8Owq0dgbdeO8DjMUSJYsYzWzG
	5OuVi8Zc3Yi+01HpXlS7QuHIG3i+b2pULsa2sYOqBypFJukuzfT6znCjv8S5XVMW
	RcbDY6tAOZVn3cvJZQJbQvPJkX27b0V3YroFDxw8W/n9V/c8m5RQfpB0beTarYaK
	17FD67YNbbqgSttMYfV6Y4IC9GDLLQV0YlyVC4nLwxeSurd0mcMf7xbZ6kVqhvuI
	KA5aYO4iwdAuCYoBoZpDAkc6cXDCY/B2g+K5SW6N7eGGTULiDqbcoaI9spOOf6HM
	cNOz+DA5BrQTH4JVX87Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxa8jg26v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:56:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBLuZ7a022868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:56:35 GMT
Received: from [10.110.106.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 13:56:35 -0800
Message-ID: <6398c9e4-35fa-4cb8-9832-ff4994ab10b4@quicinc.com>
Date: Mon, 11 Dec 2023 13:56:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/12] wifi: ath11k: add support to select 6 GHz
 regulatory type
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231211062216.382164-1-quic_bqiang@quicinc.com>
 <20231211062216.382164-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231211062216.382164-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ByJnVYuq5zPNUoWllLlCegAyN7cieL2l
X-Proofpoint-ORIG-GUID: ByJnVYuq5zPNUoWllLlCegAyN7cieL2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=703 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_135637_027001_1998892A 
X-CRM114-Status: UNSURE (   6.80  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 12/10/2023 10:22 PM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> There are 3 types of regulatory rules for AP mode and 6 type for
> station mode. Add wmi_vdev_type and ieee80211_ap_reg_power to
> select the exact reg rules.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


