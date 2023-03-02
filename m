Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DFAC678D4
	for <ath11k@archiver.kernel.org>; Thu,  2 Mar 2023 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BeEHzv7bGPRbIfx6nNjnzMqZKycqMXxVxYf2g9i+ZE=; b=kb+EHVuK+WbSXy
	9Ef5tW4dMgZsKdUTpqeSrqIeZcHlsqkuMYu/X7nv8DlPUqAJ+2Wf7IeHD6jRPIAh+E3qsFsXjV5vH
	6AyepcyRrTVrc71F4S6JNJEH+/5Bd4bYap7l6zFwqD1LzTUkeCqZQJQVmHM6vl6ELK573kgAliSZi
	NQigToPe3wtixQz1i7f2pjqHobq1mi8YQORie/txRfcqwLqyW3lH04w7PmCFV8n0OkroGwvkJlsjq
	jfV+/++8C7X9z0MokQSK92Zt22YaZ2ycdCNZdcYXvAPnjLuwzt8HdWOfPVCRSskXwp/TNT2LVciQd
	oA/1SwHD5vc99vhbcg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfHr-001Ptg-He; Thu, 02 Mar 2023 09:31:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfHo-001PrU-Fq
	for ath11k@lists.infradead.org; Thu, 02 Mar 2023 09:31:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3222rvKA008281;
	Thu, 2 Mar 2023 09:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rZwsUcLQ0iuC3aTvvO2VV6fN1wSyF5bOEpHMLExyP6E=;
 b=CVAh/QuGlqiPImpg6BCThJdmlLn1e2Qa93+xENGhQMwxH7O42avxVtAhvFZdlyzEfQUJ
 asbdviHRKn5kcrW730bcRmsdBU9luHA9WfL6KmY7flxdfPUbW219empnIFj35+4T+ABu
 tNxLvOk/XCCSVyT78rh/fvv1bOUqwc9oeDvC2kgd63xrITPTID+rD2Ieb90Ll5Q50tFn
 yh25e0QAQDuCOT/1a2hjfsnnC0QML/1D/JBR1PTDmwCvDhwFVh+464TDPy9v05JIOZso
 lzH+QGnRwqZ6X+XU1aJUzuw8LEeOB1OAI7c7D6rGGE7uCWXaehi5cnbDlG25QPodNDuU +w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p24uwb24f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 09:31:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3229VWMl015828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Mar 2023 09:31:32 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 2 Mar 2023
 01:31:30 -0800
Message-ID: <e74f9d95-acfe-5150-6648-eb165f620042@quicinc.com>
Date: Thu, 2 Mar 2023 17:31:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/23] wifi: wireless: correct validation 6G Band for
 primary channel
To: <gregory.greenman@intel.com>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        Mordechay Goodstein
	<mordechay.goodstein@intel.com>,
        <ath11k@lists.infradead.org>
References: <20230301100935.170922-1-gregory.greenman@intel.com>
 <20230301115906.314faf725255.I5e27251ac558297553b590d3917a7b6d1aae0e74@changeid>
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20230301115906.314faf725255.I5e27251ac558297553b590d3917a7b6d1aae0e74@changeid>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oyigKNH8X5-5uV96XCG6uJwH-hAF3EB1
X-Proofpoint-ORIG-GUID: oyigKNH8X5-5uV96XCG6uJwH-hAF3EB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_04,2023-03-02_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303020081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_013140_728101_22796619 
X-CRM114-Status: GOOD (  10.60  )
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

On 3/1/2023 6:09 PM, gregory.greenman@intel.com wrote:
...
>   	 */
> -	if (channel->band == NL80211_BAND_6GHZ &&
> -	    (freq == channel->center_freq ||
> -	     abs(freq - channel->center_freq) > 80))
> +	if (freq == channel->center_freq)
>   		return channel;
>   
freq is KHz, channel->center_freq is MHz, so should change to if (freq / 
1000 == channel->center_freq)?
>   	alt_channel = ieee80211_get_channel_khz(wiphy, freq);
>   	if (!alt_channel) {
> -		if (channel->band == NL80211_BAND_2GHZ) {
> +		if (channel->band == NL80211_BAND_2GHZ ||
> +		    channel->band == NL80211_BAND_60GHZ) {

it should be NL80211_BAND_6GHZ, NOT 60GHZ?

...


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
