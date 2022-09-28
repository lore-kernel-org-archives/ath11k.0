Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E52EC04A95
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diN0C8+Kn4xGEnZyJ++MqFDXdHofsWcjKDJE93TvS6o=; b=f6+c361PQGkr2E
	brrq50kAdolVUYGINUw8IPfI09/r6tk5UhPShyN3ReTERY3JRggi5ymy/6kh4al7DEJT/il26leXm
	OluWr9W9C/x24VF6e/tih8qRGTRUR2Acmhf2+6BJLlJRVzWC083s3c00EnSgx6ltThejI9ew2pYF5
	3DC0iCHjvQIhBDPBnOcPQfs5p3jE/zNtmluNmO2JB0mPrvF9K/IBXovAJ4OKH5riNAwewXDxA6M94
	2086I6WzcLT0si2lt2YlQkkqLhPuaxyQnSyczBp8dVpMq2OyLC2rtDZHmWJE/txegpfdpJZEvzJkT
	avv7CDbU5vz9XZqK9aRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYmX-00Gr8u-7v; Wed, 28 Sep 2022 15:15:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYmT-00Gr7g-PN
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 15:15:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SD9XMq028978;
	Wed, 28 Sep 2022 15:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XXMZJOF4U/G1KdVZJFaEBgm2/7dhehp/e3bKTQDT9gY=;
 b=l06WA+2LV00v2YGMT5Q3YSgR3yzUlwadfo4EjXtD2kNLlGAPMympOILFWg4RzgwxDWrB
 6lEU1KZaOhixSdx/yqEJ6+YxUaPjrqC3Ewap/x0eKIUgakXRinVn9vT4tKjFIRVZfnOG
 udecipZ4g5YTslIBBLEmA2aR5oEqFYEOsuW5/6x/IfP8Q5DXOUZhiBjeuC9lEIlzfH8Q
 63GmwObA6EBdxgFjPkdog1IkKFPwvfpz7nyq3bETnQXq2z+DFEMdq5IuisR4C+iJnwqK
 LsOft1GvR3DvnA9ICdK+veXfrPtzPw4u5R0vrH+iRlGr6E9IWyiFrFH5FNo8bUNVXXTt Zw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvpuv8ema-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:15:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28SFFOaZ012525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:15:24 GMT
Received: from [10.253.33.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 08:15:23 -0700
Message-ID: <5771c6e4-b406-0535-d63d-981da1f607b1@quicinc.com>
Date: Wed, 28 Sep 2022 23:15:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: unicast probe response bssid changed by "wifi: mac80211: do
 link->MLD address translation on RX"
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <e1c5fbac-7e6e-c643-f24d-32cec779f2d3@quicinc.com>
In-Reply-To: <e1c5fbac-7e6e-c643-f24d-32cec779f2d3@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: A_n0UFruUkxaSFVnBjmG9pIInRWhpobY
X-Proofpoint-ORIG-GUID: A_n0UFruUkxaSFVnBjmG9pIInRWhpobY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxlogscore=669 spamscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_081525_867523_60B5C70B 
X-CRM114-Status: GOOD (  15.60  )
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

Hi Johannes,

May I get your comment about this?

On 9/14/2022 11:13 AM, Wen Gong wrote:
> Hi Johannes,
>
> The mac addr of unicast rx packet all changed to the MLD address by 
> below patch.
> Now the probe presponse which is unicast packet is also changed mac 
> address here.
> I found bssid which is the MLD address of my test AP in 
> cfg80211_get_bss().
> For example, if the AP has 2 mlo links, link 1 is 5 GHz band, link 2 
> is 2.4 GHz band,
> then the 2 probe reponse will be changed to a same one.
> seems we should skip probe presponse for the mac address change here, 
> right?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=42fb9148c078004d07b4c39bd7b1086b6165780c 
>
> wifi: mac80211: do link->MLD address translation on RX
>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
