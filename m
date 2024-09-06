Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B934E6FE41
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIe/mcRmIOgwDEvWBcGTWDvnQ2KluYGPbNhonz0OWpU=; b=Es2VoL9UpAtmfJ0ah0gJmuHdP6
	gEkteBXKw49R9R0Fm3uLxaXKkw05WTCik+65F3n7sspGKx69Y5zrchktGBt3gbwceFz3BCDFttiHw
	hhxQjdDHkQcm8oQy/Lza5BfCyJ+hEQENfYMqDVDlta+BkzlASurwqXTJdaKe4NfURtIQpqxYDBlMY
	Mp0b5BczZHFE0jJXF5oZonBD0bPFTbUsk5n121I05/WQwsz6Ehr/Ll8PsNVygcm2DiXsMxv4Ig15P
	MRJQ0XPPuf+Oi51Z15knJoX8fBnVjuXnqzVzzU7lxfE6MAYy0H6+H4GhogEyUNF4L0ckPYkqxqYn9
	Wu6pBg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smdqf-0000000DIx5-2ma4;
	Fri, 06 Sep 2024 18:38:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smdqc-0000000DIwM-2K9H
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 18:38:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868YIJM032629;
	Fri, 6 Sep 2024 18:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CIe/mcRmIOgwDEvWBcGTWDvnQ2KluYGPbNhonz0OWpU=; b=nVDCSPOEHs9oAW5u
	URoeclmDMSEFchBuRrvrhePsBPh8IfAHbHsdpWv/8+YeyVDqlt88tdb8UVEEIPer
	FyWeqwhFWSmmjNUDwKho3dbxkxLUTYJ+MAV9ox3Up8EgI3aJnRnow2IqYWr1kI7/
	YGNDs2jIab3rzQU+XYykqzQHSZ+3/P81vnZue55thlFYpb7SdGWcwRW2GgU05mcm
	iKVW1MvD7ytz4Pg6D1xS9ehovbpOHeDVF9/oUGLh+Qory0xF2bb9OA0G3qg4YsSV
	3TfjwJ0TviwIkngqeA4dvnkZX7IZKD6xFWRLnSOiF4NotEtAOgibAXSWQ9qMsl1H
	iknhmA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwtb87r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 18:38:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486Ic8OP008394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 18:38:08 GMT
Received: from [10.111.181.108] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 11:38:07 -0700
Message-ID: <1e77b503-36ff-4a97-993b-f87d658c9970@quicinc.com>
Date: Fri, 6 Sep 2024 11:38:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kalle Valo <kvalo@kernel.org>
CC: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240814082301.8091-1-brgl@bgdev.pl> <87a5hcyite.fsf@kernel.org>
 <CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
 <87y146ayrm.fsf@kernel.org>
 <CAMRc=Mfes+=59WP8dcMsiUApqjsFrY9iVFEdKU6FbTKAFP1k_A@mail.gmail.com>
 <878qw6hs4s.fsf@kernel.org>
 <CAMRc=Mc_Qy6-Rgsw_uOweUXtoiZGMR0D22Ou9nXUJDDdPCZqLw@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAMRc=Mc_Qy6-Rgsw_uOweUXtoiZGMR0D22Ou9nXUJDDdPCZqLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nxSgVBbnrS-V-S73ijR707OYrT48BYGa
X-Proofpoint-ORIG-GUID: nxSgVBbnrS-V-S73ijR707OYrT48BYGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_04,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_113818_763816_9D319D9B 
X-CRM114-Status: GOOD (  13.90  )
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

On 9/6/2024 12:44 AM, Bartosz Golaszewski wrote:
> For upstream - if you're using the WCN6855, you must specify the
> inputs for the WLAN module so it's only fair they be described as
> "required". For out-of-tree DTS I couldn't care less.
> 
> You are not correct saying that "M.2 boards don't need these" because
> as a matter of fact: the WLAN module on your M.2 card takes these
> inputs from the PMU inside the WCN6855 package.

Let me start by saying that DT is one area where I'm a newbie, so I hope I can
get some education.

I'd like to start with an observation: I've used both WCN6855 with ath11k and
WCN7850 with ath12k on an x86 laptop without any device tree, so from that
perspective none of the device tree stuff is "required" -- these modules "just
work".

However I also realize that when these are installed on Qualcomm ARM platforms
that there are GPIO pins that control things like XO clock, WLAN enable &
Bluetooth enable, as well as voltage regulators, and the device is
non-functional without those configured, so the device tree items are required
in that environment.

So just from that perspective saying something is "required" is confusing when
there are platforms where it isn't required. And perhaps that is what is
confusing Kalle as well?

/jeff

