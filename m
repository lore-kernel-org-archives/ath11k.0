Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464D7C369C4
	for <ath11k@archiver.kernel.org>; Wed, 25 Sep 2024 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+38GOmygiW9XUvstBAjolEL2L0r0UfsO4V78w/iowXc=; b=f32XkfHsPPwbAM+Xpqec9PFM4d
	6FQI86v+zrknWG9CfpAwr5cZbFZUK2fV/RfhKj13nHqiLmjA6W1ybVd3Ip7MvVSAvkDlhJxVybBPi
	5Mdk+Ha2h48pww6JGUQR+Dd8dinqoLXsLK4Dr+J6tMjm2lzQdPT2XE80OE/81QRDC1x63zd0E0ECt
	3WGB4YJxBTjZ4gBVeDtYFp72YXyDoHbzGcXY1rKQEv/KJaulAwwoAPEBDWx6j2Z73atc14hHm0Mh2
	wbN0gHq/RY1lF+pAVaCA/iAOBus8Tyx3vXrQkT8ZIQe/v5kd1z7Vz+BWoY03ye7yH5So8qb5ecq5c
	Dsaa1IXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stOwC-00000004hxP-1u4o;
	Wed, 25 Sep 2024 10:08:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stOw9-00000004hwz-0fnJ
	for ath11k@lists.infradead.org;
	Wed, 25 Sep 2024 10:07:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P8kIXw031702;
	Wed, 25 Sep 2024 10:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+38GOmygiW9XUvstBAjolEL2L0r0UfsO4V78w/iowXc=; b=aLclYhixJFdzp2l6
	+84y8J0zjgp9vX8HotS6Qrxxv4Dtl4TxcgD8DwOuB4ii+xsJoK3ihhUBVTU1Claq
	EOG2y6RFa01QACSsK6yn93NvYuzQXVO4uq0bLy6al14y1c+u8Ali/76tZjLmqwen
	8Rp7VdJ7io3ukHI+aujVw4+pHXZ/towcwzKucdLdFL7KEGr/hWcRjPA0krmrvy59
	IhTKrduCOsLhXYEgQq3wJ0SyxEeadXdXlhIQ71o2WGkPnN+JQJaQhjKu6I9qJ+qr
	afKwqq/bh+DUJM82mTdqXfageoP/I4UJI0DW1C9yW/EEBnXG5ZA14Umb1CqENMcW
	KvW8Mg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6utx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:07:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PA7ruh012546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:07:53 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 03:07:52 -0700
Message-ID: <fd90d471-503b-4f58-ae11-bae2afab08c7@quicinc.com>
Date: Wed, 25 Sep 2024 18:07:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k/WCN6855 neighbor report request made immediately after
 connection gets no response (with MFP)
To: James Prestwood <prestwoj@gmail.com>,
        "open list:MEDIATEK MT76 WIRELESS
 LAN DRIVER" <linux-wireless@vger.kernel.org>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kZUCtKEp1hFLA3jxvBaUhA7splbbZ8qG
X-Proofpoint-ORIG-GUID: kZUCtKEp1hFLA3jxvBaUhA7splbbZ8qG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_030757_349254_86FAB9CA 
X-CRM114-Status: GOOD (  17.16  )
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



On 9/19/2024 8:21 PM, James Prestwood wrote:
> Hi,
>=20
> I noticed an issue when we started putting ath11k clients on a WPA3 net=
work which seems to be related to the fact that management frame protecti=
on is enabled (works fine on WPA2 no MFP). Immediately after an initial a=
ssociation a neighbor report request goes out and we get no response from=
 the AP. After getting a PCAP in one case we noticed the neighbor report =
request went out unencrypted, though still had the CCMP IV parameter. The=
 content of the request was the unencrypted request, and something like 1=
5 bytes of 0x00 padding. I will say, this initial PCAP was made through t=
he AP vendor so perhaps it automatically added the right keys to decrypt =
the frame, this could be a red herring. I tried on my home network and it=
 was hit or miss, sometimes I would get a response but sometimes I wouldn=
't, but I did see the frame was always encrypted in my home network case =
though when adding the PMK directly in wireshark I couldn't decrypt it, w=
here on other hardware like iwlwifi I could.
is your home network also WPA3?

and how did you get the PMK? is it generated by IWD and printed as debug =
message?

>=20
> Some time after the connection neighbor reports work fine. I'm not sure=
 of a time frame or delay required that gets them working, but it makes m=
e suspect that ath11k doesn't have the keys fully added in the firmware b=
efore userspace gets signaled as "connected". Running the same scenario o=
n ath10k or iwlwifi has no issues. This neighbor report request immediate=
ly after connecting is IWD's default behavior, so its relatively easy to =
test by just restarting IWD.
I captured a WPA3 SAE PCAP too, but only can find some unencrypted ADDBA =
req/resp frames. for those encrypted action frames I am still struggling =
to decrypt them

>=20
> Since the neighbor reports work fine after some time its not really a c=
ritical issue but I wanted to bring it up just in case.
>=20
> Thanks,
>=20
> James
>=20


