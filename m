Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AD2C02194
	for <ath11k@archiver.kernel.org>; Thu,  6 Feb 2025 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8zAkc5/qP+ByAbXrbpXW3BsRNr6mwhyvhlUPAxusKI=; b=Smz2/sTjcXnEemUcbHV2nA26cX
	4CQMHwR+YK1WKbOwZW1pw/mnEDX+V8D9Bv0TaBGcPRvqoQceMRxDl5PGsMurDXJ+8IFGjrmcW1dci
	05GLtXvvITccCZPion1H+Li38Y+ycNgh3R2uc7qktNGdxg3MUW9I81DH/dQ+NSSK0uUi3uRTCD2XH
	V3xGRlHTdVL/XnmAhewD+ZtP7vqPTeY1a0GmS1YKLyx65jtC05hckAJ37TXHHmqiAvBL2GscYFros
	HT9VLW0s4RoVKnH3PH9wPb77PliX/hz7t/mwaSavUQBiBQveEM9P+AeiHWOktPHd6HhMtNqYfN7ZM
	Fui5wiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxze-00000005nwX-159C;
	Thu, 06 Feb 2025 09:16:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwar-00000005dl2-2Qn7
	for ath11k@lists.infradead.org;
	Thu, 06 Feb 2025 07:46:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5165WgWa008340;
	Thu, 6 Feb 2025 07:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8zAkc5/qP+ByAbXrbpXW3BsRNr6mwhyvhlUPAxusKI=; b=j0prtUEZOOZ5SZ61
	hTJHkLK7pGFWQu91EGxceFbkIzrrop6DHAvti9yK+Vy1f5JvDdbQGaMtr3KhFfP6
	RQ7RJC+4YEst19zzeMpTh37PTj42WLnDAfuLCPQcj7Eqgn9TrYJiBzNCaAbj65ch
	rlGcP4plwQBcEUwQP3CaPUWxlu973kvYOA+/W7/qOrgivT4DigQqx9JlCfVfoqSj
	nJj3jTu03H4+DCChiuQi5jNX9w4Np0wS50TEqOYE6b+/D8KkMfGdxtVOpwvIBb/p
	NDzXyUXct2kBznvFPcY3y5IkOVuY2JJrGLxuqnnAzeznPfRO2vbIGzJtJbxeO+f7
	ZoTfaA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mq1br9cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:46:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5167kXNL009139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:46:33 GMT
Received: from [10.231.195.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:46:32 -0800
Message-ID: <e1c9b030-8a6c-4aba-8bdd-853113bef396@quicinc.com>
Date: Thu, 6 Feb 2025 15:46:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>
References: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
 <20250115130359.138890-1-jtornosm@redhat.com>
 <748a5a75-1385-4691-85c1-e9cc5eb4ffc2@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <748a5a75-1385-4691-85c1-e9cc5eb4ffc2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qHhCslNjS-S32Lq3iWcKAEj-ISPFHeXz
X-Proofpoint-ORIG-GUID: qHhCslNjS-S32Lq3iWcKAEj-ISPFHeXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=420
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_234637_626435_B19F22CB 
X-CRM114-Status: UNSURE (   6.37  )
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



On 1/16/2025 8:31 AM, Jeff Johnson wrote:

> Kalle, can you review? You currently have this deferred in patchwork:
> https://patchwork.kernel.org/project/linux-wireless/patch/20240829064420.3074140-1-quic_yuzha@quicinc.com/
> 
> /jeff
> 
Jeff, can you help with this because Kallo has stepped down?


/Yuriy

