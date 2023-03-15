Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0B0C61DA4
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWe+gCW2wvyGTpFu99QwmkTG2zpMYXw6Wjpgf+KHeUg=; b=4vJfR/FyQv9h+r
	xwmnsEnyA3KAirZzOxk6znqxXWTYbVyihYjYZLTpHJV0sAqo/7z+Mdhl39zlEw7yh1J+GRY6Lq9hb
	hAovB78WbgNynsHpKwoU4bQxENrwV3wFdkpANHdUHN38Rf2rc3SRZq0NjvkL+PHyg2dtruU5Zo3KV
	5OAsjMOb9GQqTjD6k4SkygGUsWmz7WLoo9dl3pjOOHBASGaYVayZTxYnDq6Ktam4sWEex1MOVLmpI
	NdjtVyyjF0Jkn0k2MjdFtxYzWax6LsjvGNoYYsWCqq376hAg+03n3mwkrmwquRmtFDSPCAd4wdkHs
	anqtLusXZKY5sHfUh5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcTkb-00E24b-1y;
	Wed, 15 Mar 2023 16:13:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcTkZ-00E23r-0a
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 16:13:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FALac9020632;
	Wed, 15 Mar 2023 16:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XbyTqVEZoMayy4FBsG765i8DzXTgj5W9IpKJdmRYcKo=;
 b=RNcXhnlNkwRCDWRog0TVR9izCzoE479+T62rGOrIbGorioZlwb7XWR38CJeXcZMdCGuY
 aAFCBaLzkFVNheKjs0oKhmEo5GOaLld6QRcrkUoA5QnS8OOcqV7/HiLldd5GZj+uh1og
 Zdq7vV64jEtDAIbL4WIyYHLMOq7CsBoesaLPQt3L/A7uuerYrfuCWeYoIJwUXbxaAYxE
 ZaBRfYiuVQJGl1q7c+5kPJ+lhlsGQuqoPnDFcvFte0Knj1XY7xclUN3/3007YVNwK4yl
 ysSg63WX4fAAEmGkTblcSYUitWFsX4IO4Hj9IIqiPibt4w9Xvs+Kl0d2eHJBbN/sxhiW /A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pb2c5t6fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 16:13:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32FGD3Up006155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 16:13:03 GMT
Received: from [10.110.5.11] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 15 Mar
 2023 09:13:02 -0700
Message-ID: <e7425af0-7b40-df42-0942-71016ba47e25@quicinc.com>
Date: Wed, 15 Mar 2023 09:13:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/2] wifi: ath11k: Fix incorrect update of BCC counters in
 peer stats
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230308174703.12270-1-quic_pradeepc@quicinc.com>
 <20230308174703.12270-3-quic_pradeepc@quicinc.com>
 <87mt4emhrq.fsf@kernel.org>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <87mt4emhrq.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: M-zC7lgBqJbJ7jCm527IVUyB3_BgpSv6
X-Proofpoint-GUID: M-zC7lgBqJbJ7jCm527IVUyB3_BgpSv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_08,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 suspectscore=0 mlxlogscore=969
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_091315_232274_54E687AF 
X-CRM114-Status: UNSURE (   7.98  )
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


On 3/15/2023 3:27 AM, Kalle Valo wrote:
> Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> writes:
>
>> Fix typos causing incorrect update of BCC counters in 11ax mode.
>>
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> What are BCC counters?
Thanks Kalle and Vasanth for review..will address the comments in next 
revision.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
