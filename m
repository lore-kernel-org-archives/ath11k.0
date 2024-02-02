Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218CEC4828D
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 02:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MyOR6juEfYYlI/Kvs5o3c2m2K3i/huXkF9+m7b70mw=; b=rmZAEVCf3KvXU/wze9sovRRkVm
	QClvIpphN9qnsdMWKs39tAuzG30VixOE+xGGsAEbhg3lmlo7px0qznirAmUAjJit7fw/fL37C/BL/
	x3Bt7sWsbRidE3r2PuxozV7KVwj4pvBX6AGjOHtSEWP5Lpb+tue8xt9o9rP+yiSbakRihQscYc14O
	tl93DQ2RzT4YhoQOLS6oAeT8535cIL7S5yd08FiH/HwEMjD6z+B3GOZIpponyapICNVbTpBOMW4Xn
	YFdLl+qjShoXmOs5tJEYBZkXkJP5hMDlYS6ZNMEl/Ex2pZMX6s2u+b3KnA9amnpJ9cJs055L2bKNr
	fJxihTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjYp-00000009vVr-3NLB;
	Fri, 02 Feb 2024 02:45:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjYn-00000009vVH-0NFQ;
	Fri, 02 Feb 2024 02:45:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4121WY86014692;
	Fri, 2 Feb 2024 02:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8MyOR6juEfYYlI/Kvs5o3c2m2K3i/huXkF9+m7b70mw=; b=Br
	OT32d6T0L7urISx7NL1ls+pluG4RJGOjiwgOhTFhIuWDb01kLZdKYCAt+c5vHLKz
	jA91qh8P5VFM8mKnl6Lsyt6iqJ6F18e+hIT6I6FHyc+O2277v3VTn8SnYj48UbdH
	Em36vTK6xyRew3niYdwM8WukEsyk4q1zROxhZgfhymTQ7i+VkktOcyR9ZU8HiTBo
	yDBvW7B1EDGVy4DJ+pKCt0nV9hIbi39aEd2UJw6mWFT9bTeG85Wgc/+SMlUlX7tP
	8gSQX4utKGx/gosZigCEsQh6jKKAp8I7sR6QomxQNYCJVyeHjih710iGhEVITeSX
	de9QPGBIC0Pr0qSD7o3A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0ptv03sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 02:45:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4122jeO8002795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 02:45:40 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 1 Feb
 2024 18:45:38 -0800
Message-ID: <a626846c-0b0c-4656-bf10-0fc187553aaf@quicinc.com>
Date: Fri, 2 Feb 2024 10:45:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <ath10k@lists.infradead.org>,
        kernel test
 robot <lkp@intel.com>, <ath11k@lists.infradead.org>
References: <202401311243.NyXwWZxP-lkp@intel.com> <87ttmtvfx4.fsf@kernel.org>
 <a2fb59bb-6090-433f-9c3d-d35aaab93e70@quicinc.com>
 <87zfwktaws.fsf@kernel.org>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87zfwktaws.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ItZ-MkuCs1zMEHsVRJCi0tg0Yi7BC60u
X-Proofpoint-GUID: ItZ-MkuCs1zMEHsVRJCi0tg0Yi7BC60u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=790 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_184545_177054_00EAF5D3 
X-CRM114-Status: GOOD (  11.68  )
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



On 2/2/2024 12:19 AM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> On 1/31/2024 8:35 PM, Kalle Valo wrote:
>>> + ath11k list
>>> kernel test robot <lkp@intel.com> writes:
>>>
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
>>>> head:   2c471f31297856be56f60ef29f2565dea1470800
>>>> commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi:
>>>> ath11k: fill parameters for vdev set tpc power WMI command
>>>> config: i386-randconfig-141-20240129
>>>> (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
>>>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes:
>>>> | https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
>>>>
>>>> New smatch warnings:
>>>> drivers/net/wireless/ath/ath11k/mac.c:7949
>>>> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol
>>>> 'eirp_power'.
>>> Baochen, could you take a look at this new warning and if it's valid
>>> send a fix for it, please?
>>
>> I sent the patch yesterday. search
>> "wifi: ath11k: initialize eirp_power before use"
> 
> Great, thanks again Baochen. It's always a good practice to reply to
> build bot mails, something like "This is a valid warning, I'll fix it"
> is usually enough.

Got it Kalle, will do.

> 

