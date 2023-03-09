Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87036C61DA4
	for <ath11k@archiver.kernel.org>; Thu,  9 Mar 2023 04:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkKeYjCuWWVdXp8CWt1od7YN+uy9JGCKTPS216ozt3k=; b=Nj5oJTO3e9DN4a
	pkzQu7p5lyjJicTmF2IJZtGD1eXSD54/ChgLbmX2iKfuY3pQa1mSOEcf7baWJDnB/gumEGJUSmnb3
	Px+6/jnUT6oJzBo6DEScVXjygg8/PDH0GT4xiYNe8WEFAh7yad/2b1COTPkwRWfCw+TZDoNqgMjFi
	NB8RQ5op0aHSBiMORKv4fxIzIO7JQvByxcV9nodhIhWcm7O+KYfYGtfuMVR2imjPWa0ZLppqwGcx5
	MKQktY/UDReRgnXUpFoVGCcv98qteha29N9r1YWDEp0/hf5/YDw5TODhGbPh/LgiP9UhysrPEklRa
	CoQjjMtu9C3mjWVoTCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa7Vm-007k62-Lc; Thu, 09 Mar 2023 04:04:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa7Vj-007k5L-Ic
	for ath11k@lists.infradead.org; Thu, 09 Mar 2023 04:04:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3293f8cf007278;
	Thu, 9 Mar 2023 04:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vavMggNry2oiFPgwYlRjsx9+acsQH0CZ3zlcyU1W4LY=;
 b=kjzrrgemWFzFDO2YxhfBlVAPrackvWcDsW1ZEi0h9+YfqxXPuLyK52I1Tqy3tjku7Fs8
 ++RRhyQFQEX3ppPVytW8W2prcvMRMo+mzLbiwWDTufo01LfTUzQUN+S5KtMJpLHU0rs9
 GXZqizHHdqQCG7YA3LKsBXxhys47fRPwof9TNpXYIm+u4XIL/WQ9bCaC9c4wT0xTVWZo
 dcGoOY7muaoj3ZJeYfj9KL7RlaxGpFmFKXKkISbdqkKz4BwBM56mVPU/7tfjmTfHE0Pc
 uYstD0xl3EDiXwpMPn5KjHutWx7Nlq8LvYM4t9s1fh9o0/SU5VZACU+LVDZ3T9hQkfnq 9w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6v2dss3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 04:04:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32944Awx007361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Mar 2023 04:04:10 GMT
Received: from [10.216.31.114] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 8 Mar 2023
 20:04:08 -0800
Message-ID: <f35a3228-d708-f713-7bf0-d862deb9a575@quicinc.com>
Date: Thu, 9 Mar 2023 09:34:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] wifi: ath11k: Fix incorrect update of BCC counters in
 peer stats
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230308174703.12270-1-quic_pradeepc@quicinc.com>
 <20230308174703.12270-3-quic_pradeepc@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20230308174703.12270-3-quic_pradeepc@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hRKzrVDUsUWgnkwJ20P-7cH9kNL6Ipa1
X-Proofpoint-ORIG-GUID: hRKzrVDUsUWgnkwJ20P-7cH9kNL6Ipa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_01,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=796 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_200411_649280_3998427E 
X-CRM114-Status: UNSURE (   7.18  )
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



On 3/8/2023 11:17 PM, Pradeep Kumar Chitrapu wrote:
> Fix typos causing incorrect update of BCC counters in 11ax mode.

Not sure all these will come under typos. They seem to be bugs no?

Vasanth

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
