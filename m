Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93DCC02180
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uz/6fhele6leCcFPn5Jh5fYePL/JQZ0S+IBb3VNglmw=; b=F0sucfcLEVb8LqJ0saxpq0WNkU
	Jf2N1ZvZ+M4c9bMgGSZP3sLIxZWJ7Z3wCjd8iyzajmVKWO9kdD+GFWRN0P1TnfarakhGXP32M1NCc
	QzVzdLTzG9sp92Dm6u/y/0yMr2lwaCY8M9+mZnPWBI3x2ftzIO45Tu9jozKe3cjON7QsjY8ZlZGXG
	E+CVqCJ77TbxBEZMsw7wNTICOsovMkolV5bPJFuWZEa5IK1pArYKBWJ4RrJMr6r8gShvduymPTofJ
	AgPop8A5frbAMoMMzx69L4GOHvGkehf8nI7z9VUT8ceqgjw33yp5dfSewJ6eUxF0ow4GRRa5N7gjY
	50HG85Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzG1-0000000BCO9-1OLC;
	Wed, 15 Jan 2025 09:00:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzFl-0000000BCIh-0i2S
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 08:59:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F0b0B7001652;
	Wed, 15 Jan 2025 08:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uz/6fhele6leCcFPn5Jh5fYePL/JQZ0S+IBb3VNglmw=; b=icRelXqN5gxgvoF0
	r3x2SvURuVYQch4xbvVj4IY/yBHN9wopuPIYI2bUfcDCcmsyz1oCL2d8d7m93QaA
	CghaC64xCfxfeK6/HO0ZDu8yUQmVG/0+DJaf9PeURNmrdznJrJI9wq51ih2vfHQu
	CkeYxqVXnYKCtPPNfttPqBqLqPU8+P9LZRh9+MASMyNyOAeRBJ6Bt6TUsrCo35M4
	sBHjqxjEvu+aXvgtAb7VWwzpmOpep2dRKu9SPuZL1aUSTdmQkklaVGsw2AKmW8gw
	/T8k8YYQvPdqtFYPEl9MOUHyqB5kZ2zx7ry0ugJmHHZWmp2qu+HbwMM2tchj0N5C
	EoKWfQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4462mkh2g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 08:59:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F8xq3o022981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 08:59:52 GMT
Received: from [10.231.195.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 00:59:49 -0800
Message-ID: <52a3efe8-c550-4494-af63-6b8c6894e7b5@quicinc.com>
Date: Wed, 15 Jan 2025 16:59:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <quic_cjhuang@quicinc.com>, <vbenes@redhat.com>
References: <20241211174155.30782-1-jtornosm@redhat.com>
 <20250114183405.60530-1-jtornosm@redhat.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <20250114183405.60530-1-jtornosm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1Nne0vRexswM3qvsjx9R2ha9i_v-MOea
X-Proofpoint-GUID: 1Nne0vRexswM3qvsjx9R2ha9i_v-MOea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=776 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_005957_399175_00907EE0 
X-CRM114-Status: GOOD (  11.65  )
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



On 1/15/2025 2:34 AM, Jose Ignacio Tornos Martinez wrote:
> How is this going?
> Could you tell me if your proposed interface combination (or any different
> solution) is going to go ahead?
> 
> Thanks
> 
> Best regards
> Jose Ignacio
> 
Jose, could help to share the complete logs (include NetworkManager 
logs) after you applied 
https://lore.kernel.org/all/20241127022742.4016870-1-quic_yuzha@quicinc.com/.

Now I try enable NetworkManager in my device, find that:
When use "iw dev wlan0 interface add wlanxx type __ap", NM will change 
ap to managed mode.
Use "ifconfig wlanxx up" that can't up wlan2 that same with you, but I 
use hostapd can also up it, due to hostapd will change it to ap.


And I see your previous reply, if your device is sta+p2p+sap+sap?
"So, since the normal sta interface and p2p interface are initialized,
with your proposed interface combination, only one AP interface can be
added for me (vdev limit is 3).
I like your idea to have a common interface combination set for 
everything, but I think it is not possible here.
My patch with the new parameter at least allow to select what to do, 
dual stations support or APs support for all the cases."

Another way, could disable the NetworkManager service than try it? we 
can confirm it firstly.

Thanks,
Yuriy



