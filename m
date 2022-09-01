Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1EFECAAD1
	for <ath11k@archiver.kernel.org>; Thu,  1 Sep 2022 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ddaOL2/EKuOiAVlshv+PR4NvBfW9bD1Gh9dFLm4iA8=; b=tgzKfOXE/MJ+fE
	cxrewcBhYWuY1Wm1YIl2xlpsi5sidiMyufGBOE0ciU03xCDwYWfUz5PWdOAL9S4VoK5ZPualVhiH7
	/cIPfbmlrPCp4dJHZBaGLawCAuuuAtxEGRDsinGH5WwhxGMaiBHqXDnsKzPqTJVRANbIioBZNdNTo
	BITBUclPp7kcoVTS3PaZ6d66GgWDLBpHkWsw0V9Ojk4BTPbS1k6MZ9DHDtYk3yv6ltMcupYpK68kq
	F7eW9j310Iv7voFcOsj07TKMuWV8xrnYyUqkUuhVAS3ri+f9TrcrX8koI4eVVxh86rk/peJbo2rO1
	oDyY/NYdAhVZE3E5qvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTezK-00APL6-D3; Thu, 01 Sep 2022 07:51:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTezH-00APKS-6l
	for ath11k@lists.infradead.org; Thu, 01 Sep 2022 07:51:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2817fXKN012735;
	Thu, 1 Sep 2022 07:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Eue0sgk6Iw3bZUoNX6C5z7ZR+QgUaCW+vtC2/KkgeWM=;
 b=kQuE34P24KCd/FqEHX0l1tPu9uzAOd3x4kZB5W5CcRyC6UHqQKxywnz4ebSuZVU3cAlE
 +7VCLxfkzcPi3widY1O6MpHEL7u8cUx1cWFCW3SquqlH1AhxbXVmzdKyEr2TQ9MYtDvD
 ItYDb9FM+OyQn4ys+wCHkY5Zr1ZTtScJfYKbXYmG7fLhixpFgu9JlLZiq8hR2boqEdF8
 ZCkqQSnH4d9FD8Hg0v/YZNpMlzH5YEKkhTMqvcai1iVMlRrBe6HOoTUrKyxGX6xkslks
 QNOXzzHhUGjJNUMBAEA6DBPwiT1qf2LvKMkZFoJPalisoAVwu5Co9l5LN7ZYh9VEei74 Nw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j9txbn9yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 07:51:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2817pcmk010552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Sep 2022 07:51:38 GMT
Received: from [10.216.18.118] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 1 Sep 2022
 00:51:36 -0700
Message-ID: <0b6f1484-0e07-dde5-6c33-a898f5711c17@quicinc.com>
Date: Thu, 1 Sep 2022 13:21:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ath11k: Add support to connect to non-transmit MBSSID
 profiles
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220720134622.15293-1-quic_mpubbise@quicinc.com>
 <166192554340.26203.2447393721716803657.kvalo@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <166192554340.26203.2447393721716803657.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v6BB_cZCBHJIyKx5c0LQtxE0QAM8n93P
X-Proofpoint-ORIG-GUID: v6BB_cZCBHJIyKx5c0LQtxE0QAM8n93P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_05,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=953 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_005143_392236_88431B4C 
X-CRM114-Status: GOOD (  12.39  )
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

On 8/31/2022 11:29 AM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:
> 
>> Add support to connect to a non-transmit MBSSID AP profile.
>>
>> Non-transmit MBSSID profile parameters are passed to the firmware
>> via WMI VDEV UP command and this helps firmware to track MBSSID
>> profile within the multi-BSS beacon and report beacon loss if
>> any.
>>
>> WCN6750, QCA6390 & WCN6855 firmwares have the support and hence
>> enable the support on these hardwares.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> Failed to apply. Again please use --base.

Sure, I'll rebase and send the next revision.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
