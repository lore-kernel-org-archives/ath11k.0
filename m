Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1ADC433FE
	for <ath11k@archiver.kernel.org>; Tue, 18 Oct 2022 08:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hC3vcYytNegCViS003Oesq523ZDN077l9mw4MrqDjBM=; b=1fS5xwu9Uhdemi
	zoXqYthiq7CWmXLl2LQbXgSbIWDNb2OVtLUcDbtBNMHBM3PXocckByvQVN2hQVDrNqihsdSA66mbt
	Oj0vQ1RboH+eS3aPQOa3/BcFbRoMpxYKwIDb7oCDYxDRG1G00Ui/ZNr+pDLDRuogjkcfcaYn6Cwap
	MMigZ8t5PlxdhqYvJI6zyb/osEhWD7qy3B30Rw2pz1fLYoW9mmoag+FmHKT1hD+H0UE1Gvfe+DebU
	iB3VBmyEQZ/upgXiJ/6QlpMG69aHJgtkshVP5lBjnKl2H5e1+j7151hcj8xDaDY0flIbwB5T6zx5s
	hBspnP0DOql8OY/HObEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiEi-004Ruc-OD; Tue, 18 Oct 2022 08:46:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiEc-004Rrj-03
	for ath11k@lists.infradead.org; Tue, 18 Oct 2022 08:46:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I74gCi018496;
	Tue, 18 Oct 2022 08:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=L5jCjMpDzZ03jpPZWSRZ+HovW1q0xDO1nNMxbrDfvx4=;
 b=gAPiY+JnlX223e0G6Pu3kPhnkJ9KZwKV+Kky+teqYRZSP4U8ERNasGEdED+7M7reU/LU
 LuHzAzsbQ0dTam/tr9CjgTT434upF5Co6yOJz+TwIrGzO7MsnHsHmtHmCcMDDmTCy9to
 dh2o+RdB8GuhCWmAmENoa8GR+/j+p7F6Wd4odr0Z6bN0K48D0CImDtC6QavqQ2AWSROo
 eTVl7ywwvZUO6TPDy1LA9EKMuYUOPxG3jqABFqcWg5L4d+PE/FtDoLmOXt08qJf7fkK5
 vpGytfSA/inP8cU6/RR/7pu649sOS0JUZaVxKik+fTJLTHXkBRhFBK2NUaQY434gz78Y 8Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9hnb0yrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 08:45:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29I8jwLf016827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 08:45:58 GMT
Received: from [10.253.75.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 18 Oct
 2022 01:45:57 -0700
Message-ID: <4630025f-5cbf-1b5c-cd73-2797d10ec81e@quicinc.com>
Date: Tue, 18 Oct 2022 16:45:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: wifi: mac80211: mlo rx nss value 0 of wifi
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
 <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
 <91b975e2116521cfa9f9371a976039a53ed9a85c.camel@sipsolutions.net>
 <2a2c466fbdcc2c3cc7af81bcd4d370d0119ea865.camel@sipsolutions.net>
 <c52e6634-4a90-f165-9f41-8f23df9414a4@quicinc.com>
 <ca0f6ea2d78538ffb6640f2e56d65c89c86f5221.camel@sipsolutions.net>
 <191042d8-7781-808f-71aa-db76ed763bec@quicinc.com>
 <dbb569976328b5442c6373a8aaacfec9a157ac56.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <dbb569976328b5442c6373a8aaacfec9a157ac56.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LR7ud1brEowB-9OwXw-scJidQguXLuP1
X-Proofpoint-GUID: LR7ud1brEowB-9OwXw-scJidQguXLuP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_01,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=909 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_014602_068419_202EE7C0 
X-CRM114-Status: GOOD (  12.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMTAvMTcvMjAyMiA0OjE0IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIE1vbiwgMjAy
Mi0xMC0xNyBhdCAxNjoxMiArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+PiBJIGd1ZXNzIHZhbGlk
IGxpbmtzIHdhc24ndCBzZXQgYXQgdGhhdCBwb2ludCB5ZXQ/Cj4+Pgo+Pj4gQW55d2F5IHNob3Vs
ZCBhbHNvIG1vdmUgb3V0IG9mIHJhdGVfY29udHJvbF9yYXRlX2luaXQoKSBhbmQgcHJvYmFibHkK
Pj4+IGludG8gc29tZXRoaW5nIGxpa2UgaWVlZTgwMjExX2Fzc29jX2NvbmZpZ19saW5rKCk/IFRo
YXQgYWxyZWFkeSBkb2VzCj4+PiBzb21lIHJ4X25zcyBjYWxjdWxhdGlvbnMgd2hpY2ggaXMgcHJv
YmFibHkgbm90IGdyZWF0IC4uLgo+PiBPSy4gSSB3aWxsIHRlc3Qgd2l0aCBteSBjaGFuZ2UgaW50
ZXJuYWwgbm93LiBBbmQgcmVwbGFjZSB0byB1c2UgdXBzdHJlYW0KPj4gY2hhbmdlCj4+Cj4+IGFm
dGVyIHNvbWVvbmUgZml4IGl0Lgo+Pgo+IFdlbGwsIEkgdGhpbmsgeW91IHNob3VsZCB0cnkgdG8g
Zml4IGl0IGFuZCBzdWJtaXQgdGhlIHBhdGNoLCBJJ20gbm90Cj4gZ29pbmcgdG8gZG8gaXQgaW4g
dGhlIHNob3J0IHRlcm0gLi4uIDopCnVuZm9ydHVuYXRlbHkgSSBhbSBhbHNvIGJ1c3kgYXQgb3Ro
ZXIgcGxhY2UgaW4gYXQgcHJlc2VudDopLvCfmIEKPgo+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
