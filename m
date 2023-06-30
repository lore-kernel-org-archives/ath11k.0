Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88759EB64D7
	for <ath11k@archiver.kernel.org>; Fri, 30 Jun 2023 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pNPincQTGdmARzQGhWxREGpnAN7oYzaAFOlGyACgiY=; b=UKUUPGgXfRTt4S
	L2WTpWOxb0/k3h6KGVkPNCpQ0fO6hpnnjg1qQ33Jgit5J/s///XBsirOPtqLyX63MXkaU9ua9KbHc
	/VWbLGXbCTM4o+9MqWipKAmSxnwg36GAalU86Z7WxTnZH+oiZHdTHFzIKyCPyEIs3Cfazm5XAFEgA
	ibi8xr1aRwlAlFLksqz/vcspr0+Gr2WGGElTsbdq8FMFbbIylaoCgODLTd/5scvgb+9J076iqLfbI
	H+Sr3wBVfXmIVTJtXragCePZS9V0XrF1OimIPQTWIiGLPhQGlfiGTwVTtkzGwAqEanOCzJxoA1HKz
	PtEcZk3Xkvt4N55+1U8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFAUJ-003IDP-2z;
	Fri, 30 Jun 2023 09:32:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFAUG-003IBz-0t
	for ath11k@lists.infradead.org;
	Fri, 30 Jun 2023 09:32:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35U8rA2O009671;
	Fri, 30 Jun 2023 09:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PK24KpSvL0d1KNy5acQjsM972gYJThX7jVCYosHgcX8=;
 b=Svdl01UpCRa7sW4Kd8D/iu53nOScPxSqY/knNpQS3dmhlDBefVebiH/66g3A+BZygG2q
 XP2O6OVnASOBimnzUt8WFiwHr5KaQy+2wAzEir4fxz+KFx3Ta1k9NE61H2c9RpIYwoie
 gbVm9ARa2xTn95oooGCTBRqvHoqilvB/DycVj/gOpanBwN3rgK44VV9w56WDW83vYTcf
 ZCWkEMumk3oxzwtnVqTztO2bGDyopOIssH5kwk4251YdmHE+JylyC3fNPvUtxxMwypHl
 x2cPAceEJtqX1P0XHPmr1O6W1viOkBrreNIDYUSCVHvn6F9X6ljebf6ZiSDtkQLHFmqu pw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh4y6auqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 09:32:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U9WEW1023000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 09:32:14 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Fri, 30 Jun
 2023 02:32:13 -0700
Message-ID: <bf774594-d1f9-8183-b5cf-55b2c0479aa4@quicinc.com>
Date: Fri, 30 Jun 2023 17:32:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
 <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
 <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
 <2cc79101249548f2a92c14af6aff6121143907d6.camel@sipsolutions.net>
 <1c26c205-0240-7670-117d-02a7af068724@quicinc.com>
 <6f8db032286923845202c7d658f1d39db79a758c.camel@sipsolutions.net>
 <a7093d7a-0179-7b5f-cc61-a501331d35c6@quicinc.com>
 <c60af4eb116ed330e8035503fb7944f8853bcfa4.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <c60af4eb116ed330e8035503fb7944f8853bcfa4.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EjeUSHDCPmsfhSyh1c7o2LQPVaf5FISr
X-Proofpoint-ORIG-GUID: EjeUSHDCPmsfhSyh1c7o2LQPVaf5FISr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 mlxlogscore=645 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_023220_320635_349ECFD3 
X-CRM114-Status: GOOD (  11.16  )
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

T24gNi8xNS8yMDIzIDM6NTYgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVGh1LCAyMDIz
LTA2LTE1IGF0IDEwOjI2ICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gT24gNi8xNS8yMDIzIDI6
MzIgQU0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+PiBPbiBXZWQsIDIwMjMtMDUtMjQgYXQgMTU6
NDEgKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+Pj4KLi4uCj4+IENvdWxkIHlvdSB0ZWxsIGRldGFp
bCBhYm91dCBob3cgdGhlIEJTU19DSEFOR0UgZmxhZyB3b3Jrcz/wn5iBCj4gVGhlIHdvcmsgaXNu
J3QgY29tcGxldGUgeWV0LCBidXQgYmFzaWNhbGx5IGl0IGp1c3QgY2FsbHMgdGhlIGNhbGxiYWNr
Cj4gd2hlbmV2ZXIgdGhlIHZhbGlkX2xpbmtzIGNoYW5nZWQsIHNheSBieSBsaW5rLXJlY29uZmln
dXJhdGlvbi4KPgo+IGpvaGFubmVzCkkgZ3Vlc3MgdGhlIGxpbmstcmVjb25maWd1cmF0aW9uIHlv
dSBzYWlkIGlzIGZvciBzdGF0aW9uLCBpdCBtZWFucyAKc3RhdGlvbiB3aWxsIGRvIGNvcnJlc3Bv
bmRpbmcKbGluay1yZWNvbmZpZ3VyYXRpb24gYWZ0ZXIgcmVjZWl2ZSBsaW5rIHJlY29uZmlndXJh
dGlvbiBpbmRpY2F0aW9uKGUuZy4gClJlY29uZmlndXJhdGlvbgpNdWx0aS1MaW5rIGVsZW1lbnQp
IGZyb20gTUxPIEFQLCByaWdodD8KCkkgZ3Vlc3MgeW91IHdpbGwgYWRkIGVudW0gQlNTX0NIQU5H
RURfeHh4KGUuZy4gCkJTU19DSEFOR0VEX0xJTktfUkVDT05GSUcpLCBhbmQgY2FsbAp2aWZfY2Zn
X2NoYW5nZWQgb2Ygc3RydWN0IGllZWU4MDIxMV9vcHMgZm9yIGxpbmstcmVjb25maWd1cmF0aW9u
LCByaWdodD8KCkFuZCBkbyB5b3Ugd2lsbCBpbXBsZW1lbnQgYm90aCByZW1vdmUgbGluayBhbmQg
YWRkIGxpbmsgb2Ygc3RhdGlvbj8KCkZvciBhZGQgbGluaywgaXQgc2hvdWxkIGNhbGN1bGF0ZSB0
aGUgbmV3IGtleSBvZiB0aGUgbmV3IGxpbmsoIjM1LjMuNi40IApNTCByZWNvbmZpZ3VyYXRpb24K
dG8gdGhlIE1MIHNldHVwIiBvZiBJRUVFIFA4MDIuMTFiZeKEoi9EMy4yKS4KCi0tIAphdGgxMWsg
bWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
