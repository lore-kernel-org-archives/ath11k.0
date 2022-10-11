Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6A9C433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 03:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rphTNbphku3ERp46pvzhK5WaRF6F8tYKxFm407UEgi4=; b=TJPfgZV373ekwc
	K/asdcMkdBe/UNm1LBBc5XyFAo+BsEZ1KWwQJVx376pjmdiGsGVO8xTugjdHNpudGC9AMF76HnOJx
	6xlQBujBKXcRRUKUSea0Juzbks9WTWThu7G2HNM7kj28BgYeFNshlxM862cpB8Ry+LyDvCIYtWOQK
	bQ6s44+hmsPI+HqH/8FBEkk9PAXA3aQI7XviRNu6LJ7sh0G/p8A3jQODO/OXylQCkyBsyM1inC9C/
	7+2zBmGxBMd3TpNwu7e8ruYPuZjg8eXBZfK8zWuDXzdLpPFwp2rGETPqtmW2Lk637+XcSj+GyiNOA
	OuNdPsC25R8DDIMqTe7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi6QB-003CaV-Ub; Tue, 11 Oct 2022 03:59:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi6Q9-003CZo-34
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 03:59:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B0w9NI019604;
	Tue, 11 Oct 2022 03:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=494NNedELfIMNmPVaonTNe1XkmyugotD6Ma+MQntz7g=;
 b=R0jMW+/rdUpQ3h0o0yavQslsemyQgE/6Aul5werPIctNpOKJmSNZC/xl6qQyW8OYoqos
 X7NDsMZemPp83TdOWRKcZQWFxwCctoGir7l71UCndloH2Wj4QDAlNuJcheo5PFm7VCfo
 e8b5kmio97t8az1AVANrLE7UTcy7jA6VeLTMSsxpculr3d5x/LKgz7jFo1Yhf8gg8CVo
 AXHOIODcmQBiFYgCi/cfgpuTleeT7sE+oQoQ81XPN34hw7UM9KoC8eGsBqOLTYNLOZ6N
 xnkelqS+5lj/W84W9qf6utJOjcO0ZLs1E/TfGsRFs1ovy6IEOyg4dv6gHo8m1mmjVERC wA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rx4h4bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 03:59:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29B3x2aG023687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 03:59:02 GMT
Received: from [10.253.78.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 10 Oct
 2022 20:59:00 -0700
Message-ID: <0526d034-2cb9-527e-b338-f73db0ed005b@quicinc.com>
Date: Tue, 11 Oct 2022 11:58:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] wifi: ath11k: change to set 11d state instead of
 start 11d scan while disconnect
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220928081413.27339-2-quic_wgong@quicinc.com>
 <166542536986.511.1244496445875563981.kvalo@kernel.org>
 <f50c94b9-252f-25ab-4650-bed52762bc4d@quicinc.com>
In-Reply-To: <f50c94b9-252f-25ab-4650-bed52762bc4d@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SDbHr4xgZWvzsufSngI3VFUnKpwHtzKe
X-Proofpoint-GUID: SDbHr4xgZWvzsufSngI3VFUnKpwHtzKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_02,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210110021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_205909_165362_0A4CA4D0 
X-CRM114-Status: GOOD (  14.23  )
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

On 10/11/2022 11:53 AM, Wen Gong wrote:
> On 10/11/2022 2:09 AM, Kalle Valo wrote:
>> Wen Gong <quic_wgong@quicinc.com> wrote:
>>
>>> When switch to connect to a new AP for station which is already 
>>> connected
>>> to an AP, the time cost is too long, it arrives 10 seconds.
>>>
>>> The reason is when switch connection, disconnect operation happened on
>>> the 1st AP, then 11d scan start command sent to firmware, and then a
>>> new hw scan arrived for the 2nd AP. The 11d scan is running at this
>>> moment, so the hw scan can not start immediately, it needs to wait
>>> the 11d scan finished, it increased the time cost of switch AP and
>>> even happened scan fail as log below after apply the incoming patch.
>>>
>>> [ 1194.815104] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>> [ 1196.864157] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>> [ 1198.911926] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>>
>>> Change to set 11d state while disconnect, and the 11d scan will be
>>> started after the new hw scan in ath11k_mac_op_hw_scan(). Then the
>>> time cost of switching AP is small and not happened scan fail.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI 
>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>>
>>> Fixes: 9dcf6808b253 ("ath11k: add 11d scan offload support")
>>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> I still see warnings:
>>
>> [ 3627.691737] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>> [ 3715.435608] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>> [ 3860.333214] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>> [ 4542.000955] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>> [ 4604.018451] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> The failed log is now happened frequently as before, I will change it 
> again to suppress the failed log.
change typo.
The failed log is NOT happened frequently as before, I will change it 
again to suppress the failed log.
>> 2 patches set to Changes Requested.
>>
>> 12991768 [v2,1/2] wifi: ath11k: change to set 11d state instead of 
>> start 11d scan while disconnect
>> 12991769 [v2,2/2] wifi: ath11k: reduce the timeout value back for hw 
>> scan from 10 seconds to 1 second
>>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
