Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFE1C04A95
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 15:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+kVZ1kdyx6O16/kougwcCjj3SUuio9Da55/K8W7ddQ=; b=kQVTKJqElZD+m1
	nFtIA+lSud5phcisSWcLpJQEKN7VnL0T1Hr5SFXARnAG/t72ka0f+dZJd+JVYugknPtic0IJn2m0R
	nngOtSMj1w8jw42tNapxb03scc3hhCXBecTYRpOk/H2mESK0278TuSJ/5iuXCPkgrsRji8S/5BywV
	84W3rd7Ja8zKgqOldoZ1JdkcMOHcCh17H+/z2/DRHisSZ9vkEcXRK6tgo27m8GYIGNpLs+G4mZx+S
	zmzIkrItAeCL1Xt4UVlpjE+IuqOag1EpO580NUb3+iCJHwWeSYST4R6nDgoQoOg2An6N2MwGSZZ8Q
	fs8wjlffD9GaYsmEbJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYkG-00GqOJ-FU; Wed, 28 Sep 2022 15:13:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYkB-00GqLu-Cd
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 15:13:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SEwRKe010586;
	Wed, 28 Sep 2022 15:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cvk9dv6mH5Aoy3+SdYH6p59yvzRLULMoXt4Be3XQd6Q=;
 b=dah1V4H7/OtU+rdcabEzZcmyaJ99CP2DyZQDq9MojE8vMZ9xoYYoj5af/ZMLqZeZ311m
 x38dWvohgNmoGBb12deM/JWc3HBnwbrSfXSOBEKWMdHvlJ22FBOTM5B+GNG4VXaUw2RJ
 uEN8T6CRK7KfxVSY1b2RIfh40nOK7H5RHX7hbfhKcGLxMi2uRzOr4ZO0aU6KOH1MEYEH
 TeOKTQjzDh7o/s6d9g7vrS/sESKEPftJZVsjNRvMFg0m1W4RRwoGD1FFDnQiZRueG1Af
 W0+rkDS9FPI0KqLiA92BhDzDCC5NDpM1l6DEXFyCNr+esL67W4bOmV4HX4aob6bnDXRj eA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jva41jk0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:12:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28SFCdBF010891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:12:39 GMT
Received: from [10.253.33.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 08:12:37 -0700
Message-ID: <96bcc467-c530-46de-8f91-c5eb0af7a368@quicinc.com>
Date: Wed, 28 Sep 2022 23:12:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 00/27] another set of MLO patches
Content-Language: en-US
To: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "Peer, Ilan" <ilan.peer@intel.com>, <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <6175bc95-201c-cfab-2ae6-9ba77e830394@quicinc.com>
 <09556b33ad998ad243cf75dbc230f3b07349a87e.camel@sipsolutions.net>
 <935ef9e9-2092-e3f0-0edd-4aa29f4fa775@quicinc.com>
 <e01e75013f71ede7b29f2751238935e7147796f2.camel@sipsolutions.net>
 <f3afceb8-8120-12c7-74b9-caa3abce5cb8@quicinc.com>
 <DM6PR11MB3897D1A4E13419D9F938F559F5449@DM6PR11MB3897.namprd11.prod.outlook.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <DM6PR11MB3897D1A4E13419D9F938F559F5449@DM6PR11MB3897.namprd11.prod.outlook.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: raKA5M2u0eGt9DB4loN8s7r_oZ4SYvMa
X-Proofpoint-ORIG-GUID: raKA5M2u0eGt9DB4loN8s7r_oZ4SYvMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_081303_477630_F1D89179 
X-CRM114-Status: GOOD (  14.92  )
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

On 9/12/2022 9:17 PM, Otcheretianski, Andrei wrote:
>>> Well, OK, you obviously are adjusting the supplicant to work with MLO
>>> (otherwise you wouldn't get an MLO connection in the first place), so
>>> yeah, this is part of the adjustments needed.
>>>
>>> Ilan/Andrei have all of this working, maybe we can share the patches
>>> even before rebase etc.
> Hi,
> Our implementation is based on our internal tree, so it will take some time to cleanup and port it for upstream.
> Hopefully I will have some time to work on it this and next week and maybe we will be able to share something initial.
May I get your patches?
>
> Andrei
>>> johannes
>> Thanks.
>>
>> It is good to share me the wpa_supplicant patches ASAP.
>>
>> And I have another question:
>>
>> When mac80211 use the MLD addr in authentication/assoc request,
>>
>> finally, it should be replaced with one link's address in air port, right?
>>
>> It means the MLD addr will never exist in mac80211 header of packet in the
>> air port, right?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
