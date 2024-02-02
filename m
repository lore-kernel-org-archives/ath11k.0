Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2C9C48291
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk7BwcRvegcVOez6WN6YBR1Lo3V8ZCng/o8HMDa3jAs=; b=PAVqqrt7sEdza+giYIwopZ3blL
	5adqpbZKqQwX7+tbWrrrBRzWGMLCM4Jdla5VlXhawW6TK6hxJMR68i3kFvLv6i4XgOgB2GZtwA3uP
	QnAbJZF1CP+wbveauZL3ivwvxEBqiUp3wlswYMoNpik3euAKWt5bWR2JnCPPSD4znQuuAC4R9Om8W
	HQg2dTKb202hBROHEBYnBDmod6IXE7XR8rVvaLnQOtsyUkLlYMpeJc7LMUV9LQMiN2Hpciy+Q1FoW
	JkpIceGI/zSv8EQwwhSkq7N+mwDNohSI44tFnsr46858SGD7B3pX0gUF4j78eQ75aR9AESI1l9RHA
	WplTE7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxRw-0000000CcZP-1Ro2;
	Fri, 02 Feb 2024 17:35:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxRt-0000000CcXo-1PQN
	for ath11k@lists.infradead.org;
	Fri, 02 Feb 2024 17:35:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412FxVR5027811;
	Fri, 2 Feb 2024 17:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rk7BwcRvegcVOez6WN6YBR1Lo3V8ZCng/o8HMDa3jAs=; b=V9
	gs43fFWHziKb09WVYNcm4zEo7vih/JEvL+/tS+WnUGgaSzXqtUc+ZpexvqjqwmzL
	hFtjyLfDw/XE40Fvjuw21M539TS5nBLvVN7XpR1+qHMoYaYzrkKY3mcheR1cSHnx
	OsLn4yLwtHLmDsuAJJk0gjJGJb3xCqtsuTpAOxL2tjQaLAUl3a3lFhK7V4n44JlI
	47o0LxVXAResKJP40UJOar4HXQ79w0wfEtuVisjzSVmN4NA9lKO1E9hc4/x9rsgS
	DfkEkrlH0/nSmCGylkJPWsrUW9+Cj2AlK6RedzYJzDHKrBudcECuZg6fynEJ4NGn
	IaHaSnL1iFhIG5ea8TxA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0ptvj04c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 17:35:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412HZVS2016696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 17:35:31 GMT
Received: from [10.110.16.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 09:35:30 -0800
Message-ID: <acccf6fa-6a99-4909-97cf-da5e31a171a6@quicinc.com>
Date: Fri, 2 Feb 2024 09:35:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: initialize eirp_power before use
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240202024011.11341-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240202024011.11341-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DjOtAFSEt8bmk67x5Powmtrh4KZVdb9l
X-Proofpoint-ORIG-GUID: DjOtAFSEt8bmk67x5Powmtrh4KZVdb9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_11,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 lowpriorityscore=0
 adultscore=0 mlxlogscore=189 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=1 impostorscore=0
 mlxscore=1 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_093533_413485_4DD8CF45 
X-CRM114-Status: UNSURE (   9.50  )
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

On 2/1/2024 6:40 PM, Baochen Qiang wrote:
> Currently, at the end of ath11k_mac_fill_reg_tpc_info(), the
> reg_tpc_info struct is populated, including the following:
> 	reg_tpc_info->is_psd_power = is_psd_power;
> 	reg_tpc_info->eirp_power = eirp_power;
> 
> Kernel test robot complains on uninitialized symbol:
> drivers/net/wireless/ath/ath11k/mac.c:7949
> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.
> 
> This is because there are some code paths that never set eirp_power, so
> the assignment of reg_tpc_info->eirp_power can come from an
> uninitialized variable. Functionally this is OK since the eirp_power
> only has meaning when is_psd_power is true, and all code paths which set
> is_psd_power to true also set eirp_power. However, to keep the robot
> happy, always initialize eirp_power before use.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Fixes: 92425f788fee ("wifi: ath11k: fill parameters for vdev set tpc power WMI command")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


