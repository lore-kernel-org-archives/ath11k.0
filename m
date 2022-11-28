Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFF2C433FE
	for <ath11k@archiver.kernel.org>; Mon, 28 Nov 2022 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LV5hWO3O5bz+I3xFgLyWACwB3iDN75KhdVPcSggHsU=; b=m0XVg2fU5VIsFS
	tTmdLYBmHLgSglQv3PLU8oUuuybzHPA//gGHil52iVkTvBQguzODwiB+B9kxb/VwuWYdKZUNeAx6S
	MseNZBUTRn5AzjvxpderGeMZ+7mQCSXbA4KianYQKwYWIKMdm8CUipQCjr2KMJyN74CfMPNrhxxO4
	WlT4SMjnQtj9Raz4GjUTleUx+oylGbLA6jYJBq4NqcHKk72J0bCuz5NqXfgMEfU6t1BbUr148baUx
	ZzZq9N8JzT/EkGnYYc6yPHAMn1kiNN9bqKSlFadgCTplYM/4xyCoZRt+KrYQHENUCFCJjy/nM/R3Z
	gUqRhrPGTIwQXENvdTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZlP-000Lsw-Pz; Mon, 28 Nov 2022 08:45:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZlJ-000Lo8-N3
	for ath11k@lists.infradead.org; Mon, 28 Nov 2022 08:45:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS5oJTA018909;
	Mon, 28 Nov 2022 08:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jus7okDsZiVBsZ9MUogqbWkyxD8xss8oPtgSM/wya8E=;
 b=OP+6AisnARUAinT/mzBAuipCEOlbrR1Kn+Ggl4DW0ypWsVoP0cJ5T10ks9Vemb4vHFWq
 Rb6CQCXT0KDxi4Yx5Mg/0RzlyyxqPEbzAtLi1ijr4AZPhdrUarXlVCqrAS5XxAnJa2Ar
 67X6g678m9BeT5p8hXQ0eQBGBEene9nnRrspQdcLUZCj6Uh8sMaQ5kicNDWaKqdeiyBQ
 A8l3oVA7V3xVyTA7/lsHFH/HEgFwqVeOfWa9KZL5hqbQjlSIBrStKx1Yq5jUsg1AkL1r
 jeTa31MBVZvlt5GZyEmhmOotuh1cpo8wG9f+9WsVPiHbPtVEJtNON+jVpvg87iFUPiiY 5w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m3bywutuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 08:45:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AS8j7j7025262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 08:45:07 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 28 Nov
 2022 00:45:05 -0800
Message-ID: <a3edddb2-82e4-2c79-564f-1918b59aead9@quicinc.com>
Date: Mon, 28 Nov 2022 16:45:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: wifi: hostapd:/wpa_supplicant MLO Re: [PATCH 00/27] another set
 of MLO patches
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>,
        "Peer, Ilan" <ilan.peer@intel.com>
CC: <ath11k@lists.infradead.org>
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
In-Reply-To: <de54f4e0-810b-70a0-7629-39a2957ecd3d@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lyAcXvc_U3sxVIY_J-_kUeEDSB16VFEV
X-Proofpoint-GUID: lyAcXvc_U3sxVIY_J-_kUeEDSB16VFEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_07,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_004513_810649_8AA84A66 
X-CRM114-Status: GOOD (  14.59  )
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

SGkgQW5kcmVpLAoKSXMgYmVsb3cgYWxsIHlvdXIgcGF0Y2hlcyBmb3IgTUxPIGluIHdwYV9zdXBw
cGxpY2FudCBmb3Igc3RhdGlvbiBtb2RlPwoKWzAwLzEzXSBNTEQgU1RBOiBBZGQgU01FIE1MTyBz
dXBwb3J0CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvaG9zdGFwL2xpc3Qv
P3Nlcmllcz0zMjk5MDkmc3RhdGU9KgoKT24gMTAvMTkvMjAyMiA2OjA0IFBNLCBXZW4gR29uZyB3
cm90ZToKPiBIaSBJbGFuL0FuZHJlaSwKPgo+IFdpbGwgeW91IHNlbmQgeW91ciBwYXRjaGVzIG9m
IHdwYV9zdXBwbGljYW50IGZvciBNTE8gdG8gdXBzdHJlYW0/8J+YgQo+Cj4gT24gMTAvMTEvMjAy
MiAxMDoyOCBBTSwgV2VuIEdvbmcgd3JvdGU6Cj4+IEhpIElsYW4vQW5kcmVpLAo+Pgo+PiBXaWxs
IHlvdSBzZW5kIHlvdXIgcGF0Y2hlcyBvZiB3cGFfc3VwcGxpY2FudCB0byB1cHN0cmVhbT/wn5iB
Cj4+Cj4+IE9uIDkvMjgvMjAyMiAxMToxMiBQTSwgV2VuIEdvbmcgd3JvdGU6Cj4+PiBPbiA5LzEy
LzIwMjIgOToxNyBQTSwgT3RjaGVyZXRpYW5za2ksIEFuZHJlaSB3cm90ZToKPj4+Pj4+IFdlbGws
IE9LLCB5b3Ugb2J2aW91c2x5IGFyZSBhZGp1c3RpbmcgdGhlIHN1cHBsaWNhbnQgdG8gd29yayB3
aXRoIAo+Pj4+Pj4gTUxPCj4+Pj4+PiAob3RoZXJ3aXNlIHlvdSB3b3VsZG4ndCBnZXQgYW4gTUxP
IGNvbm5lY3Rpb24gaW4gdGhlIGZpcnN0IAo+Pj4+Pj4gcGxhY2UpLCBzbwo+Pj4+Pj4geWVhaCwg
dGhpcyBpcyBwYXJ0IG9mIHRoZSBhZGp1c3RtZW50cyBuZWVkZWQuCj4+Pj4+Pgo+Pj4+Pj4gSWxh
bi9BbmRyZWkgaGF2ZSBhbGwgb2YgdGhpcyB3b3JraW5nLCBtYXliZSB3ZSBjYW4gc2hhcmUgdGhl
IHBhdGNoZXMKPj4+Pj4+IGV2ZW4gYmVmb3JlIHJlYmFzZSBldGMuCj4+Pj4gSGksCj4+Pj4gT3Vy
IGltcGxlbWVudGF0aW9uIGlzIGJhc2VkIG9uIG91ciBpbnRlcm5hbCB0cmVlLCBzbyBpdCB3aWxs
IHRha2UgCj4+Pj4gc29tZSB0aW1lIHRvIGNsZWFudXAgYW5kIHBvcnQgaXQgZm9yIHVwc3RyZWFt
Lgo+Pj4+IEhvcGVmdWxseSBJIHdpbGwgaGF2ZSBzb21lIHRpbWUgdG8gd29yayBvbiBpdCB0aGlz
IGFuZCBuZXh0IHdlZWsgCj4+Pj4gYW5kIG1heWJlIHdlIHdpbGwgYmUgYWJsZSB0byBzaGFyZSBz
b21ldGhpbmcgaW5pdGlhbC4KPj4+IE1heSBJIGdldCB5b3VyIHBhdGNoZXM/Cj4+Pj4KPj4+PiBB
bmRyZWkKPj4+Pj4+IGpvaGFubmVzCj4+Pj4+IFRoYW5rcy4KPj4+Pj4KPj4+Pj4gSXQgaXMgZ29v
ZCB0byBzaGFyZSBtZSB0aGUgd3BhX3N1cHBsaWNhbnQgcGF0Y2hlcyBBU0FQLgo+Pj4+Pgo+Pj4+
PiBBbmQgSSBoYXZlIGFub3RoZXIgcXVlc3Rpb246Cj4+Pj4+Cj4+Pj4+IFdoZW4gbWFjODAyMTEg
dXNlIHRoZSBNTEQgYWRkciBpbiBhdXRoZW50aWNhdGlvbi9hc3NvYyByZXF1ZXN0LAo+Pj4+Pgo+
Pj4+PiBmaW5hbGx5LCBpdCBzaG91bGQgYmUgcmVwbGFjZWQgd2l0aCBvbmUgbGluaydzIGFkZHJl
c3MgaW4gYWlyIAo+Pj4+PiBwb3J0LCByaWdodD8KPj4+Pj4KPj4+Pj4gSXQgbWVhbnMgdGhlIE1M
RCBhZGRyIHdpbGwgbmV2ZXIgZXhpc3QgaW4gbWFjODAyMTEgaGVhZGVyIG9mIAo+Pj4+PiBwYWNr
ZXQgaW4gdGhlCj4+Pj4+IGFpciBwb3J0LCByaWdodD8KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
