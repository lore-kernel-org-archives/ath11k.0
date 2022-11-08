Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E77C433FE
	for <ath11k@archiver.kernel.org>; Tue,  8 Nov 2022 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSFPxWh6dTSG7Q+iET/ODcxVs7ltMhvPz9SSlEQJ+q4=; b=SyndTdIHLox0T0
	m+JJdmEPGHVYLjHtdF/zz48sxGO+wjWfDiQhZMTGKsJQQpq558aMh39VjOrohmlgim8pQx9f4UR6r
	QUXg2vMd+tjh/LU21Xti+HpHQySrjVJdrB1CO9HzZjcemSNuuIcTp1GjYLhCroI8Jsd+vFpm6D1Dc
	QEDOCL+IWWaA9LjMJ52phSv+49T8i1Tg7bw04OYSVeNXvT626MH6BuuG1qiKr21Fe7G14ovSGr0vV
	eyZyShImAnCnPWGUfSpZH4W+JDOwS0Nz7fdhT9Pxkhrbvost/0/VlZ9Sy+QWXSY0ehy3OyIxX4YZU
	822nsHMwevcaezmK2ssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNLy-005023-FX; Tue, 08 Nov 2022 12:05:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNLw-00500b-1L
	for ath11k@lists.infradead.org; Tue, 08 Nov 2022 12:05:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A8BGpie021311;
	Tue, 8 Nov 2022 12:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0N8xF34uZZ3oQaq7z3zSL7RQw2wjq3nrrQc7VpDG5JI=;
 b=UT7bBe/IW79P3EM7Sjgpdx1K5RoBw1tHZwo+gy2gxnd+cYi2VQ5HCVqHvI0LFx1BOgWb
 lmOGFflaUaTsD7EMj1zDu/dvcSMbe955Z4Ebfx8v0lOR3ia7KTISUxmZeDwg/88n0DBb
 WbpLMWJmDUXhUjRXQMWipF12Y6wCot+2PxH6p/pk/zr11kv3Dlt0IarHMqSWORzUP8u4
 e0D9fT77PdnYKdZfi2/J8Wet1f5UmCyHLfdlKVo0M0cua6HPAZVYyoaz6vbLFIjfNenT
 irvuH2JwJ3QfjE5g9am70E+4ffbdVw8d4IW5jcUgwFLa2jigLPtWNoFXNiFOsagjZfg4 ow== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kq7g4j8by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 12:04:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A8C4oRd031418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Nov 2022 12:04:50 GMT
Received: from [10.216.12.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 8 Nov 2022
 04:04:47 -0800
Message-ID: <a07cb525-b814-241b-db72-840f5c17e785@quicinc.com>
Date: Tue, 8 Nov 2022 17:34:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] wifi: ath10k: Add WLAN firmware image version info
 into smem
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_mpubbise@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, kernel test robot <lkp@intel.com>
References: <20221104082828.14386-1-quic_youghand@quicinc.com>
 <166790340662.9633.4549756749859911615.kvalo@kernel.org>
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <166790340662.9633.4549756749859911615.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vujk1Lx8zud34sldkyPGbqSZ09gIs06z
X-Proofpoint-GUID: Vujk1Lx8zud34sldkyPGbqSZ09gIs06z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_040516_113274_72B72943 
X-CRM114-Status: GOOD (  13.86  )
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


On 11/8/2022 4:00 PM, Kalle Valo wrote:
> Youghandhar Chintala <quic_youghand@quicinc.com> wrote:
>
>> In a SoC based solution, it would be useful to know the versions of the
>> various binary firmware blobs the system is running on. On a QCOM based
>> SoC, this info can be obtained from socinfo debugfs infrastructure. For
>> this to work, respective subsystem drivers have to export the firmware
>> version information to an SMEM based version information table.
>>
>> Having firmware version information at one place will help quickly
>> figure out the firmware versions of various subsystems on the device
>> instead of going through builds/logs in an event of a system crash.
>>
>> Fill WLAN firmware version information in SMEM version table to be
>> printed as part of socinfo debugfs infrastructure on a Qualcomm based
>> SoC.
>>
>> This change is applicable only for WCN399X targets.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>>
>> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> This doesn't compile unless QCOM_SMEM is enabled in Kconfig. So should we add
> "select QCOM_SMEM" in Kconfig for ATH10K_SNOC?

Yes Kalle. Thank you.

Regards,

Youghandhar


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
