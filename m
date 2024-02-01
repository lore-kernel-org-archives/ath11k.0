Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E35C48291
	for <ath11k@archiver.kernel.org>; Thu,  1 Feb 2024 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6e38TQkpH6OZW9trfvxgRpSiAfC5gqn8DNebRy7qnY=; b=FuT/mvzgXJnGFFsL4ZFdz4J2Tc
	4gsNaB3yWjxIHF+YY9vQAKFMoqbRYAYsQjq7WmV/U3zFKnzG805lh7jUDNqV6dF8lsY+hVGRp2WMU
	xIQxRBaVSfmx+mgbHxsGQ/4sNyyDk+Gjy9TDNxT2DIsWNzduQ/pwL4g4qpbzIbcT3J+yNEdH4zESH
	lcSaZnldz22NMMDPS4BzA+pNqvc7HmOnAT2Vfswa1GPnzvSocXCMxHLe8TWOkHNeB9fnYh6PyvYLD
	YBz8wK6h/TTv2yfrUbOtvAkEQf+nGPeStesehWdOnrYAou/tPU0RQSpMzasoYxBTjpQpDriH480LU
	HEdyT3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVOji-00000006WTU-39bC;
	Thu, 01 Feb 2024 04:31:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVOjf-00000006WSQ-31xz;
	Thu, 01 Feb 2024 04:31:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4112mZvl004382;
	Thu, 1 Feb 2024 04:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=G6e38TQkpH6OZW9trfvxgRpSiAfC5gqn8DNebRy7qnY=; b=lb
	LAspWiOunu+iiLPvhhI8MLyQ8BEZ0AcNO2afVwuHNTGey9e4J3Km4UnilK4KeNqh
	IAR5aNImOiByPtGuv93xb702KSli7YMiNUEHoucxvK2rHJTxfhVblyzg9MRgwsW+
	lTo5ncElzYvkJmAVaVnrWS5DcLm1NFDWZULycKJ3CF10KdTqg2ZCuCC11iSAtaca
	+lyLLg7d1L5FySthor22Pu/CMBQ3XWXXdvFJ76E0r2DXaANyZlvzbKqepSbt4Srt
	RPOXwkiV5HF/Vk03Ia2No1HHueMtWAde79yhGpOv5xBdoY+s7pcFoQ4V8Mb7Wgco
	W3nattYDSR0V5Fc58niQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyx6drqg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 04:31:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4114VRtv016152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 04:31:27 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 20:31:25 -0800
Message-ID: <a2fb59bb-6090-433f-9c3d-d35aaab93e70@quicinc.com>
Date: Thu, 1 Feb 2024 12:31:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Wen Gong <quic_wgong@quicinc.com>, <oe-kbuild-all@lists.linux.dev>,
        <ath10k@lists.infradead.org>, kernel test robot <lkp@intel.com>,
        <ath11k@lists.infradead.org>
References: <202401311243.NyXwWZxP-lkp@intel.com> <87ttmtvfx4.fsf@kernel.org>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87ttmtvfx4.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 41Ph1nP25RKy1cTXV2TrIqW6cONyWe0T
X-Proofpoint-GUID: 41Ph1nP25RKy1cTXV2TrIqW6cONyWe0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=724
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2402010033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_203135_931902_333CF637 
X-CRM114-Status: GOOD (  11.38  )
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



On 1/31/2024 8:35 PM, Kalle Valo wrote:
> + ath11k list
> 
> kernel test robot <lkp@intel.com> writes:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
>> head:   2c471f31297856be56f60ef29f2565dea1470800
>> commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi:
>> ath11k: fill parameters for vdev set tpc power WMI command
>> config: i386-randconfig-141-20240129
>> (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
>>
>> New smatch warnings:
>> drivers/net/wireless/ath/ath11k/mac.c:7949
>> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol
>> 'eirp_power'.
> 
> Baochen, could you take a look at this new warning and if it's valid
> send a fix for it, please?

I sent the patch yesterday. search
"wifi: ath11k: initialize eirp_power before use"

> 

