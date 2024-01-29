Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DFFC47422
	for <ath11k@archiver.kernel.org>; Mon, 29 Jan 2024 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3RJdt4HZT0/lsSk3pmr0LA/dVSCwX27tK2gaoXum9Nc=; b=49OPgxjW5YT+P7fQj3RJ01IU8w
	7CmC/o4b+MylugoBiTVhj3UXVWgvT129RZtZCVxZ3YFSRpgAqHQ6W4B2zjrK1JUdHBRXiyq6ltVPk
	cZg6LVwBJYrlPEKNBdPZHyvamvimXPNkBBL6rr+HE2yeAWYrAcVve7qQSv05no/BpHKmLQgeLjBLR
	rO4KH/NkPA9XJtu7lQ5aC3hLG23L3N0Xxu9bkq1w1q1/rreYiCo+M5p0KwMML3VGuZkzdk8YJNMWU
	NExI5b9fvFlemM9miLgM5wIJU+IjiImC3LO/KJQ9Lxbax3vufvi85n5821wj1tE3xiEp018kpuVNk
	U73tgUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUObK-0000000CAkt-0jft;
	Mon, 29 Jan 2024 10:10:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUObG-0000000CAiV-2mtb
	for ath11k@lists.infradead.org;
	Mon, 29 Jan 2024 10:10:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T9VFYZ024381;
	Mon, 29 Jan 2024 10:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:from:to:cc:subject:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=3RJdt4HZT0/lsSk3pmr0
	LA/dVSCwX27tK2gaoXum9Nc=; b=K1jPv0J9ZR60+yCyXGp62pHwB+JrKg+Mzo0w
	kJ2HvKbq/4vbNiJBiC0l7XSZwBoR1r4kk+fStO2Q+7JCTSYHCNeflQMk2u0v32qT
	cu/VQYj3N8GUmDKsXQVJNBuwPawQJiPOUs3LjukD8K3B8sMfzCtzf18IIqHfO/rp
	5VF6GNKJqAXSF7SZJ4mF6AqrcuP++Sn3xN4v3QtVHNQWy3pww3aHoqd69D2paaSn
	y0nn6rZwsEtIwNRS4DVHmkWp258sbahL6BfdkuWNBny7VuWuO5sUyd9w8+6DNlEG
	XiXnFCxriZrvlMMwesXOduC/1fZV7ze0cERoDJduHH4MPQHsuQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx86hr7t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:10:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40TAAe9F014561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:10:40 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 02:10:34 -0800
Message-ID: <21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com>
Date: Mon, 29 Jan 2024 18:10:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <rafael@kernel.org>, <pavel@ucw.cz>
CC: Manivannan Sadhasivam <mani@kernel.org>,
        "Kalle Valo (QUIC)"
	<quic_kvalo@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>, <linux-pm@vger.kernel.org>,
        "kernel@quicinc.com" <kernel@quicinc.com>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
Subject: ath11k resume fails due to kernel blocks probing MHI virtual devices
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: saXM1sRVGRpu7ijQ6uFEfbdSF65S4T9r
X-Proofpoint-GUID: saXM1sRVGRpu7ijQ6uFEfbdSF65S4T9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_06,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_021046_876243_E1E2892B 
X-CRM114-Status: GOOD (  11.13  )
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

Hi Rafael and Pavel,

Currently I am facing an ath11k (a kernel WLAN driver) resume issue 
related with kernel PM framework and MHI module.

Before introducing the issue details, I'd like to summarize how ath11k 
interacts with MHI stack to download WLAN firmware to hardware target:
1. when booting/restarting, ath11k powers on MHI module and waits for 
MHI channels to be ready.
2. When power on, MHI stack creates some virtual MHI devices, which 
represents MHI hardware channels, and adds them to MHI bus. This 
triggers MHI client driver, named QRTR, to get matched and probe those 
MHI devices. In probe, QRTR initializes MHI channels and finally move 
them to ready state.
3. Once MHI channels ready, ath11k downloads WLAN firmware to hardware 
target, then WLAN is working.

Such an flow works well in general, but introduces issues in hibernation 
cycle: when preparing for hibernation, ath11k powers down MHI, this 
results in MHI devices being destroyed thus QRTR resets MHI channels. 
When resuming back from hibernation, ath11k powers on MHI and waits for 
MHI channels to be ready in its resume callback. As said above, MHI 
creates and adds MHI devices to MHI bus, but they can't be probed at 
that time because device probe is prohibited in device_block_probing(), 
finally this results in ath11k resume timeout.

Now there is an potential fix to this issue which would needs changes in 
MHI stack, i.e., don't destroy MHI devices while hibernating. And we 
have had a plenty talk with MHI community regarding this change, see [1] 
and [2].

However Mani (the MHI maintainer) doesn't think it's right to fix it in 
MHI stack. Instead, he thought we might need to add a new PM callback 
which will be called after device probe is unblocked. By registering 
such a callback ath11k can wait the dependency driver, i.e., QRTR, to 
probe and initialize those MHI devices.

Your thoughts?


[1] https://lists.infradead.org/pipermail/ath11k/2023-December/005098.html
[2] https://lists.infradead.org/pipermail/ath11k/2024-January/005205.html

