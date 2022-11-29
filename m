Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972ADC43217
	for <ath11k@archiver.kernel.org>; Tue, 29 Nov 2022 02:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iLn5FNa11DTJDzEvVJC7twOM+sZy90jvwaRY1ES3Y8=; b=HLmjXGcJ/Xjbc0
	9+yMRjQdjynbpVUzM95JdNNsOgYkW8hAdcAnhfIKI60+XToSHzxpsAl9Ab5EaN1fz7zJ2gJEr6/aI
	Cbczvg9d4j9Z9SMtmr4UvJff+sbiU6MBjv1IaS15WdRWh47egAhAjlfQxquhv4styLNRHv+SxoL5F
	yMl8vZaUy4eDt8nm7VP+Bykyr1HLD4iWjd6/9ITS/IBnYY6Rb65YlMkj6F+Io7TmChVKpOlUEZ5bA
	sp9Z/CE+sawjlEgXuOMqd/72Lqqvz4aCikWXboJPGyJs+llj6tOtXQj8+DLMDh1UFeT93JtLoJsMx
	niMbotgcw2EkQQfmM33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozq1d-0059QX-MK; Tue, 29 Nov 2022 02:07:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozq1a-0059NP-81
	for ath11k@lists.infradead.org; Tue, 29 Nov 2022 02:07:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT12FM1009259;
	Tue, 29 Nov 2022 02:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LoNsr7Ly+x1iojgD1Of1KzVu5OJlKS1VShGMqrOFAPI=;
 b=Ch9Uz9Mw+q2dfCPhjyDux3i/zAyNbOPfdAevDL6Aq5UUdYRZ7VWcgqCqisDyG+w3OXUG
 q9tPW8SpiXEKND/nE0IWnIteSaxML6RI564WVbf4vPX/ywjWbFW7LrNJp862xG6IWQvt
 61GrOGCpjJRNb0og2804yQDvmg1ru+QqXlboye5ZumgoTHPL38mOyE3BZz2fzC0hhOz1
 yHgzJQ0un7aE46HuxQ1unV0Y3Puii2VnNKbAWhaNEeMRjS1IPRswa8rmr96q5K3HWrK2
 MtkVtWKpRlC3TsCO8IwSTCf69Q1ImZQK47WR3sWaaeC3WJlEcAcxc6LLXQOaUoDBL+mX ow== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m3b6fwgvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 02:07:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AT270fk009574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 02:07:00 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 28 Nov
 2022 18:06:58 -0800
Message-ID: <4390cf15-50e6-9941-15b7-4927d1afc976@quicinc.com>
Date: Tue, 29 Nov 2022 10:06:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: wifi: hostapd:/wpa_supplicant MLO Re: [PATCH 00/27] another set
 of MLO patches
Content-Language: en-US
To: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>,
        "Peer, Ilan" <ilan.peer@intel.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        <quic_drohan@quicinc.com>, <quic_vjakkam@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <6175bc95-201c-cfab-2ae6-9ba77e830394@quicinc.com>
 <09556b33ad998ad243cf75dbc230f3b07349a87e.camel@sipsolutions.net>
 <935ef9e9-2092-e3f0-0edd-4aa29f4fa775@quicinc.com>
 <e01e75013f71ede7b29f2751238935e7147796f2.camel@sipsolutions.net>
 <f3afceb8-8120-12c7-74b9-caa3abce5cb8@quicinc.com>
 <DM6PR11MB3897D1A4E13419D9F938F559F5449@DM6PR11MB3897.namprd11.prod.outlook.com>
 <96bcc467-c530-46de-8f91-c5eb0af7a368@quicinc.com>
 <776991f3-384e-f487-83b7-e1fbfd40cc4f@quicinc.com>
 <de54f4e0-810b-70a0-7629-39a2957ecd3d@quicinc.com>
 <a3edddb2-82e4-2c79-564f-1918b59aead9@quicinc.com>
 <DM6PR11MB3897D1DE6EB7A89F4F6A6A16F5139@DM6PR11MB3897.namprd11.prod.outlook.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <DM6PR11MB3897D1DE6EB7A89F4F6A6A16F5139@DM6PR11MB3897.namprd11.prod.outlook.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aHsKiYQ70b3kDmhDjr2PYlII_Y2Sx2D0
X-Proofpoint-ORIG-GUID: aHsKiYQ70b3kDmhDjr2PYlII_Y2Sx2D0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_02,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=905 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_180706_429399_C34C874F 
X-CRM114-Status: GOOD (  10.46  )
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

On 11/28/2022 10:05 PM, Otcheretianski, Andrei wrote:
>> Hi Andrei,
>>
>> Is below all your patches for MLO in wpa_suppplicant for station mode?
> Hi Wen,
> We have few more for station side, like SAE/PMKSA support and some additional configs - but this is mostly what I have.
> SAE support patch is somewhat similar to patches sent by Veerendranath.
> We have more stuff for AP side (mostly for testing purposes), hwsim tests etc.. I'm starting to clean this up and will send it as well.
>
> Andrei
Thanks Andrei, did you tested your station with single link or 2 link or 
more link?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
