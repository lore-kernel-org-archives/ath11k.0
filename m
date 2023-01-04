Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01C0C3DA7D
	for <ath11k@archiver.kernel.org>; Wed,  4 Jan 2023 02:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Il8EK+6iio8qTgbEhCu9X3OVpVvfOx73YrOraooUao=; b=3pDYNBOxRonnCM
	sSsuZP4mtJ2ml3bEWND6NS7ZcsLYq+Qz4qxcb8lvd5m4Vtx5kWCvFRNMd4TPdkk6cVvn8BvbpQ5iR
	RGfd/KqpjpDNrHsIEPx+1bRQnpgdDeBdO/Lh22M1Y4hQ0d+tr2VOtcWacKDpthC9/DmU0U7e9Ip1J
	O22RJjxiavTIDDmmmIbgf2XxN26fu1RwhCnXies1zKb7X+wj89RiiOvJYwQmd1HwzUZG92Q6UozEW
	Cnf0wKaYn8zDVLYd/dgWsS45GzADi6oFxaaTDcgGFy921rF52Sf6sHOWSeuHS6b9uWN9Ve6xdAOko
	yHbxtc656CSD1Q3DQzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCtz6-006Vai-Od; Wed, 04 Jan 2023 02:58:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCtyQ-006VUP-2F
	for ath11k@lists.infradead.org; Wed, 04 Jan 2023 02:57:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303Nq27j007677;
	Wed, 4 Jan 2023 02:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wMcMDlTY49K91ZeSvBz0G5w0eMRXbxHmlLZMi7YMavU=;
 b=lj3n7gD+w6tUqo3Y9sMH3oGdLgHK/Gvt4gw/rIbVX0oNZLefP7BV8rQoF1I7QXd8M4fn
 CZefZrTdDRk3idLpf8sRYfywbB84P6vZ+bHBucKWLi07GKa7lagzaNRcAmQmiWA9aqLZ
 zi2+jzWffOGuKV8kG9IqWgCaZqVOSrd98AnYZIrXSc5iTfyupmFVVH8VNyqpx2jhSva8
 ooVBXtP5T1H/FzmimynU/29+ysZoBez2SzDGEx9Va257oRzmUzjrAqWTJIeYLHQqG4jM
 ZiKwPRa+vF+Kj0maHLOtTwK9DMmYD4cdMnc6KHbfyjRypDqHeUPTapGKH8bngJ5iyMCM xw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvwrtxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 02:57:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3042vk6J002512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jan 2023 02:57:46 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 3 Jan 2023
 18:57:44 -0800
Message-ID: <7dac372b-167c-2dff-b207-6e32fd40c7bb@quicinc.com>
Date: Wed, 4 Jan 2023 10:57:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] bus: mhi: host: Change the log levels for SYS_ERR event
Content-Language: en-US
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
CC: <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <20230104021445.47484-1-quic_bqiang@quicinc.com>
 <CAOCk7NpGBD-2nHFBE3a4WxNb4XPhEV3uoCDz1J9ArbaOE7Vscg@mail.gmail.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAOCk7NpGBD-2nHFBE3a4WxNb4XPhEV3uoCDz1J9ArbaOE7Vscg@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K2Qn6WbE-03-XthB4RCLqF6SQh3vjl4m
X-Proofpoint-ORIG-GUID: K2Qn6WbE-03-XthB4RCLqF6SQh3vjl4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_08,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_185750_286502_7E38E8E3 
X-CRM114-Status: GOOD (  20.26  )
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


On 1/4/2023 10:41 AM, Jeffrey Hugo wrote:
> Why was this not sent to the MHI mailing list?
I don't know the MHI mailing list address, could tell me that?
>
> On Tue, Jan 3, 2023 at 7:19 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>> Currently no log printed when SYS_ERR happens, this makes
>> debug quite hard, so change log level to make it noisy.
> You are going to need to explain this more.
> There are two drivers in the upstream kernel that are MHI clients -
> pci_generic and ath11k.
> I'm assuming that you care about ath11k because you included that mail list.
Yes, I am talking about ath11k.
> In ath11k_mhi_op_status_cb() I see a warning message printed when the
> syserr callback is triggered.
> I see something similar in pci_generic.
>
> Looks like a log is printed when SYS_ERR happens in all possible
> scenarios, so I don't understand the point of this change.
> Particularly given that dev_dbg messages can be trivially enabled.
>
> -Jeff

Well, this is not true in some cases. For example, we have met cases where

WLAN HW/firmware is not working well, and only send a SYS_ERR event to MHI

driver, however this event is not sent to ath11k host becuase of 
mhi_pm_sys_err_handler(),

so we got no log at all.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
