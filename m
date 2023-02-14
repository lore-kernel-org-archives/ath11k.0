Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59975C61DA4
	for <ath11k@archiver.kernel.org>; Tue, 14 Feb 2023 08:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMd01hyilP2TWrx2tYPp/e/q6pn+V+NRuS9YBdJ3JII=; b=DqTjWHYKyJ8gWMSruTlH6QlPtc
	1v3MqwuV8vjrYeav29dNE4siSIHSpApXSHkv6I+vctu1dVqJpMC99VDaoFMSYFb6BbUaotQDH/326
	3VLW3ELw6ne82PZaL1BI+DGTxp+TwlsaYNAenmvpfXND3jKSnldKigy/G+V05nEOc4qXDFVcZoBZN
	i3ND8VBlBae8ZG29Jfdhpa8hu4Ksa2+fplLmQFm76fuwxz1p7il20um8adlv2cM2csd9FFEDI7cbZ
	uJuqw6GZtdcrpomKQoF/XKXrKUiS4npp++QGJeYzVMl07HppoAbtzINx8XMjg3RLaFKLnG0+6VWd5
	Rrhh9gNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqNV-000Sqw-PT; Tue, 14 Feb 2023 08:09:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqNT-000SpY-5g
	for ath11k@lists.infradead.org; Tue, 14 Feb 2023 08:09:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E2ZKo9030886;
	Tue, 14 Feb 2023 08:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0qDo/XKEy4hSlya0XvASDJXV7HUWAhTladZrSWoZEw0=;
 b=dlqqQy/lra2Pm5/SeMd/my6eWfVk0hOGGNkFPVf0tzBg6/t0fWSylnYRFWA66FHMaQk5
 XRb9tAoyNVWUjZSA0AioT97dr3XXo96bublK2XeRUE2jbRCAZOsr/4j0WeuzTe0ab+rE
 NH1wLYKq+ZBknlljz6v50yPq65Z0vU+ES0JQCSbWEAoe9Nc4dCpdA64UIwplg/v4eNna
 vJ8vuhLXhYL/eiASHwMs9Hby6CAF4HGDhBISQSFAJo8mXNd1515ZGMIoq9JEnszKlS9K
 F5pK50X0773Q46WCu4eR9tHsnRda6p+96n/u4QHAo+hX09E2/tvvbKECLiiJEzFT0QGf Dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nqtv09f7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 08:09:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31E89PPY013296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 08:09:25 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 14 Feb
 2023 00:09:23 -0800
Message-ID: <0c15bfd6-819e-3e76-391b-f2ab70eb7eba@quicinc.com>
Date: Tue, 14 Feb 2023 16:09:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 04/15] mac80211: make channel context code MLO-aware
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
 <20220601093922.fb3f0f434c72.Icea7e695b0626177e27ab73bc8799202d623cebf@changeid>
 <34121f87-4aa6-7f20-fb1e-4d5b02d06f28@quicinc.com>
 <0e889e3be774aced1813152b18d505c0616fc110.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <0e889e3be774aced1813152b18d505c0616fc110.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7iT3D0YaWBVe4QD1ixZ-xS0icbmzIu-W
X-Proofpoint-ORIG-GUID: 7iT3D0YaWBVe4QD1ixZ-xS0icbmzIu-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_04,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=932 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000927_383326_5F189A75 
X-CRM114-Status: UNSURE (   9.52  )
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

On 2/14/2023 4:04 PM, Johannes Berg wrote:
> On Tue, 2023-02-14 at 15:57 +0800, Wen Gong wrote:
>>>    void rate_control_rate_update(struct ieee80211_local *local,
>>> -				    struct ieee80211_supported_band *sband,
>>> -				    struct sta_info *sta, u32 changed)
>>> +			      struct ieee80211_supported_band *sband,
>>> +			      struct sta_info *sta, unsigned int link_id,
>>> +			      u32 changed)
>>>    {
>>>    	struct rate_control_ref *ref = local->rate_ctrl;
>>>    	struct ieee80211_sta *ista = &sta->sta;
>>>    	void *priv_sta = sta->rate_ctrl_priv;
>>>    	struct ieee80211_chanctx_conf *chanctx_conf;
>>>    
>>> +	WARN_ON(link_id != 0);
>>> +
>>>    	if (ref && ref->ops->rate_update) {
>>>    		rcu_read_lock();
>>>    
>> Why link_id must = 0 here?
>>
> The whole software rate scaling hasn't been adjusted for MLO yet.

Got it. Thanks.

So I guess this WARN_ON will be change later.

>
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
