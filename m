Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AD3C433F5
	for <ath11k@archiver.kernel.org>; Tue, 15 Mar 2022 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBeUay+4chAf1E3lcIxVaVJuH0bL5dvF2ZCg1RpiOyU=; b=T/Pv/yC33XNJ+0
	fk3X5sIbQxUFGyOAena0QFcyfkKlJtUQlw+lCeZJL8uBD4etryu05ViN5VOK7jTQhexXKJypDqWx+
	S20iACCtDNlNZxClyQffVMRhK7DlgEeYzKM9+Vq0IUakM+oeQK+6D0jz3NOnTltHN1tTReb7BPrVn
	F+cBhoH/Sj7vtB21E1YaxX6MnXdv9Yfe0bkpZknwCcoLv1UQ7wGDDIBpjMRfwDD9z6Q4FwaYd++Np
	Hqq+gC2Ay76tQCvhaV2byQwaAmqkjCotjPHKou02XB4uAAM5XGXFztOOtndVLDguAgp5OOcmbY3kV
	KFjUgR6uC9Vzljf1GXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU5mt-008wbp-F9; Tue, 15 Mar 2022 11:56:27 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU5mr-008waj-0x
 for ath11k@lists.infradead.org; Tue, 15 Mar 2022 11:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1647345384; x=1647950184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AzFHxQ8gP6Kia+BMidIOYDLC/8oFSvk8c9RQIBGmCcc=;
 b=aYjR9lM5zhX8lBhgqnJZffcujcxXjtNeM28AaYIB9iatQxH82ApGFmxk
 66T7k7jukSwMLpdcktkd2K/cV2clg1ILBPIus+Hn+qx7/UFacezYAkk+C
 e3fjFaQrDsw1klaw0tLrX7wRvPxpQ1qgCOC1R0fqqQND86XU5WwrIW5by A=;
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 11:56:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUi17haTPQrktbynSpDLjyftcgj4DiqD6DNJWli5bVhW0XyqfRtUOuaDIuTRMn+SyiFLIZ+GI5wfCU9iuIBFMFy5aEs2gxL5fgUZAe5fGLbC97Cv17KHVFXXYBOrrcHUl4M3BS6NZWLmwkyy9dtm29np1EzHDceVxDjllj+e95ZJJezVCbWZEg36SaL+yYhJd6CH3Hym3vDa6Xc8+dKmSXStDyFTW7k8UlxFCw9PMI9Ha7Gp+RyPkKo17Sps2lijlFurfNDUf1CDDFLVHU/jXV5s3+9lhq4/bfeRqehCZIC8KlI1onV7Qlkcx+kCKO0GtUwEQMEQdXSrvn5uH+JOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzFHxQ8gP6Kia+BMidIOYDLC/8oFSvk8c9RQIBGmCcc=;
 b=koLkeQS4rB8GYMqH/pA/DBfPNovoyM2iHP/HBt+m/kTUg2QAQrN0nHC9BtaMyNi0fhjYxxDpN6TVRHbvSyKGSyVSta1RS9ywXP7aceuxgimsWcoSEFannqTGtdM5vxBf1Fbnro1J2wIg/Lp7B4Q+rcfue7dM9cdfjaAHucOxKgQsngaHwrusq63hmdBtu+uFwpM8IlNZeTcZOZiAbm//InGA8zw/xCU0ecnemImGlchkFgLxboqBpULbUvrL/W0O6zPy2htXXwGbNfv9/T5vViOiGmFjfl9nYzV6RP5h/ZvSjmuxfDqR8bn3yG4R6oNM5k0Jc6nffqG8BEuBO6NoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8154.namprd02.prod.outlook.com (2603:10b6:8:1b::15) by
 BN0PR02MB8269.namprd02.prod.outlook.com (2603:10b6:408:158::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 15 Mar
 2022 11:56:19 +0000
Received: from DM8PR02MB8154.namprd02.prod.outlook.com
 ([fe80::6da7:2584:aa5d:c39]) by DM8PR02MB8154.namprd02.prod.outlook.com
 ([fe80::6da7:2584:aa5d:c39%3]) with mapi id 15.20.5081.014; Tue, 15 Mar 2022
 11:56:19 +0000
From: "Venkateswara Naralasetty (QUIC)" <quic_vnaralas@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>, "Venkateswara Naralasetty
 (QUIC)" <quic_vnaralas@quicinc.com>, "ath11k@lists.infradead.org"
 <ath11k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCHv2 1/6] nl80211: vendor-cmd: qca: add command for CFR
 configuration
Thread-Topic: [PATCHv2 1/6] nl80211: vendor-cmd: qca: add command for CFR
 configuration
Thread-Index: AQHYIxy/nrTVybcuGUaoD9WQtSpD/Ky6KVMAgAZXzMA=
Date: Tue, 15 Mar 2022 11:56:19 +0000
Message-ID: <DM8PR02MB81549B15CB1855C71ED4D330E6109@DM8PR02MB8154.namprd02.prod.outlook.com>
References: <1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com>
 <1645005922-7252-2-git-send-email-quic_vnaralas@quicinc.com>
 <623add710d06dfd90291cb788756d37046ea2c74.camel@sipsolutions.net>
In-Reply-To: <623add710d06dfd90291cb788756d37046ea2c74.camel@sipsolutions.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8d52af3-82ba-454e-c61f-08da067ad17d
x-ms-traffictypediagnostic: BN0PR02MB8269:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BN0PR02MB82697B24FFB25EEB1F2A2BDD9A109@BN0PR02MB8269.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NuVmtht67skdrxLAe7ClRWvS4ZlNV1TX/xl3zw4a2CyP/wLBIQcJP77xHjhA7c6QjuWCHoydMS8vzbEcXQWMRCrl3PdzUPAhClvzytkJ/JEbmXZPwk/F1g0cGV5ZQer2Poyp4KblOxTXUQ3iefPruRnPlhzUHEU9XkGTuNkMcazLgAMw6NHJo1oA+RDUi8LSR3NTsB8XE5PxyO5K0bipjAnmpHWSPyWLkVxqsYNG54TAnsZnd1eQzSXKaLTn/hj4i+RFoF5qo3Wt2CL3l/ndOWWfvTcqD2ZzsQBoy2LBb7wovjMUGTtp5dbf/53FnWY+iB9FYGpGFrUmCeisLXA0QvgldNSuHxG8jD7SemL5Kvht47YtBWCDE2snB5kuvEhA8w/awSZxCSYD1hG4wyBNQ3UBtMWC8gMiMv17c2SjauSBm9j+Do3CIDNjIgzqIGr2pGJJ9NLPwEkj+OdzW8Z8qHz/iwqp+CR6OKo186S2FBn6v9g9pB3tr6/y4Hbt3PmNsqfb9Ya3flewnqQIXfxQGN5FEPL2nu5C61qsCLBYM3LVK9QwYol2V8yDmnIbKBRYb/CLUw8fA4+3zemGfNMk9IseirTfjeUISt2D3OWue57dwe39N/q6jlV73xlLFcYcb/KxHIC+J2IO9N3sBBXcTplToWEEh0ZSkBr+9ngAXKPSp7P0XnBPw//eYoaUeuoSbPAPfF7ODIvmzR1stm+A3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8154.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(2906002)(508600001)(38100700002)(110136005)(76116006)(8676002)(4326008)(66556008)(66476007)(66446008)(66946007)(64756008)(55016003)(71200400001)(8936002)(316002)(38070700005)(122000001)(83380400001)(9686003)(7696005)(6506007)(5660300002)(26005)(186003)(33656002)(52536014)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWtJakYrWW5sTG9tNVg2SmUzZ1VGQ1VxQWRqQnpzKytLRFFnTWlOSDNucnUz?=
 =?utf-8?B?cWd6eEZMempQcW5rVEE3RXQ0NjFSOXFtaVEwZE9wZEhkblZIazlINnFMTVJU?=
 =?utf-8?B?L0Z4RGYxejZFcjI0MlNFT1E0VEo3UW91Nk9NMDl3UHY4dzJCOGlEWERNWWF4?=
 =?utf-8?B?bEVoQ05DWUxUMUJPQVF0QXdtNCtUZHBVVlNTcSttdk9UcmVNa2U3WWUxU01y?=
 =?utf-8?B?VnB5YTlWbkdCak4zalVtRmZveVppMU9jcG1vN2tsUmMwNEtrWE9DN0VFaFY1?=
 =?utf-8?B?RGhZaThNM3ppUFFYaUVpWE94ZDFZRGk4RmRveVNjWWhjOUsvcDdqd0ZDWi9Y?=
 =?utf-8?B?dW5GR3N3N0IwbUFpNkl4dENnTUZrdjRNQmJDZ2ZsYlhseTNEZUlSVFM5RDdC?=
 =?utf-8?B?ZS9Sb0R0dE1wZ3hZVkc2d0RRdGVxdXUrR2RVY21uVkJ6S1F1UHBFQlh3Tjlk?=
 =?utf-8?B?aitMa0x6YlV5cE9tSDhZWHhIUDFXVTQrWTdyby9OYlMvcWpUVXRZeG9md0M5?=
 =?utf-8?B?VnVGc3ZEV2pnVXp5Y3VmTkZhOU4zQ1VRdmxBME9XSFlySlN1ZllJOEsxb0tu?=
 =?utf-8?B?aGJJellFZ0V1M2d3ZkJxVlo2Vkl0WjVXZmNBZW5waG9HdXUyUHFRRVpUOWs3?=
 =?utf-8?B?T3RJV3VFRFA4RHJKOG9FQnQvR0hNSVNTeDEzaXM5Njd2WXlxdlZtbTdqRVpS?=
 =?utf-8?B?T3dSZmVJVWk1S2djVVEvLzlOd0s0cS9sZTRUaHN0cHZYMVBXUDZMdEVLbVZQ?=
 =?utf-8?B?UnNrS3FuYzB6M0REUy94RHpMSHE1NEtGMGVkY1BsdkY5enNicHN1cnpLK1Fm?=
 =?utf-8?B?QjNtUVE2bi9BRFczTlNrVEZ2aVpXTndpd3UxQU5wcjRzYUdTTk1BbjN4V2ly?=
 =?utf-8?B?a1RlWFIvQjFIMHFnZm1XRmU1ZldLMzRhMmk1YkNmRXJXNDl3MC8wcTdobVNp?=
 =?utf-8?B?dDU3a1YrRHVIc0kzaVdDL0J3dUpKdWo0WUJ3Zkhod1ZzVkp4T2QvcS9iQ3Bt?=
 =?utf-8?B?SEZWdUNHZ2ZxWDNTNWg3MWdKMGtRdnhxOXVQY1loWXJucEViSGNJalMwcFpU?=
 =?utf-8?B?eUNncENUWFlra2VZYmFiTTcxcTVoT1RrYURhRkVXVm9rRkZsYndrWmx0QnJy?=
 =?utf-8?B?OElIRzcyc0tLc0pyb3pIOWtLcjZsZDhhZjg5d2FmNzc4U1phQlJJaGhKeXRQ?=
 =?utf-8?B?ekJkUUFrY3N2STJHTDNLQWhybHRGa1hQQ3hUK2lvb0RXZTdCT1lVZzZyZGVx?=
 =?utf-8?B?enM5YUFoanZ3ODNFcHhJZlB4c2d3a0ZGYmFvVEdCbys2THJwTjVnQ1ZibWZn?=
 =?utf-8?B?ZnhpeUEyUGlvZk04MG1DQUpCZGhSN3c4N09iRDRVbzZQRDdzdHNMemhOcE9L?=
 =?utf-8?B?T2RHeTE2UjNybzNjRTc4dTc1cFJuMW9MeGs5ZDNja01mZXczOEg0cmk5WWZa?=
 =?utf-8?B?RW9HcmE4NERhNStXUFRhb0svRFRJdWxZbjJGYTAxLzVHUDNvUk1YY1hKVFVL?=
 =?utf-8?B?TXNIUUZuV1RNaWRJK0Z2UllJaGh4MndKSmVscjlaK1kzcVNuRlQ3MGhXOURK?=
 =?utf-8?B?WWUvdjhWMDlNNjNlRWpMclhIV25WczFsYWZSeVkrY3JYR01WTm5yamExVk0y?=
 =?utf-8?B?OHRuTDQ0aGlibFhrNG96U091T0ZvZHFVdWhqZFIyZGQ3TXc2b3RDVkNYL20z?=
 =?utf-8?B?emtFWFdyektNTXp0R3RObnc1bnJsdXd3akpTZmdrYWNWdVBwT2J0NUEyUkZB?=
 =?utf-8?B?T2M5ZXV1UVErbHhVZlZsZHY2UTAzYTZqYjRTVGUzOUozZ2ZiS01WTkI1L1FX?=
 =?utf-8?B?bFFYaXZ2TDR6K3hLcWlEcDVmS1FiSzU1YXdmZmNUVWhpKzg3TDN2Mk81WnE0?=
 =?utf-8?B?SXFtNlc4SUd4ZmhWaG5hZmJLejRBRGhhNjlhU3pkTWZIVDZ6aWg5THQ2QVNz?=
 =?utf-8?Q?Yix2ebccg3+QbIEgVZpmSsNySHPhLKGy?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8154.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d52af3-82ba-454e-c61f-08da067ad17d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 11:56:19.5867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPzd8s/zIA/XnIdRr5IHBrcnrqVX3dImjcH6LmzIxaJvpGB3CgbnT3A/zykT12s2kVXBiSU9lhjVjzJ49CsyRRLfAQ5s+M3gbsPB9F1dhFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_045625_181527_AA283C3F 
X-CRM114-Status: GOOD (  21.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Johannes Berg <johannes@sipsolutions.net>
> Sent: Friday, March 11, 2022 4:34 PM
> To: Venkateswara Naralasetty (QUIC) <quic_vnaralas@quicinc.com>;
> ath11k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: Re: [PATCHv2 1/6] nl80211: vendor-cmd: qca: add command for CFR
> configuration
> 
> On Wed, 2022-02-16 at 15:35 +0530, Venkateswara Naralasetty wrote:
> > Channel Frequency Response feature is to get the channel state
> > information from the hardware based on the user configurations and
> > send the CSI data to user space.
> >
> > CSI data is further processed in user space which can be used to
> > identify the motion of the objects.
> >
> > Add vendor command support to configure per peer CFR parameters.
> >
> > An example of usage:
> > iw dev wlanx vendor send 0x1374 0xad cfr-en <val> bw <bw> method
> > <method> periodicity <period> addr <mac_addr>
> >
> > 0x1374: vendor id
> > 0xad: : vendor subcmd id
> > val: 0 to disable CFR capture
> >      1 to enable CFR capture
> >
> > bw: CFR capture bandwidth(use the values in enum nl80211_chan_width)
> > 	1 - 20MHZ
> > 	2 - 40MHZ
> > 	3 - 80MHZ
> >
> > method: Method used by hardware to collect the CFR dump
> > 	0 - from the ACKs of QOS NULL packets
> > 	1 - from the ACKs of QOS NULL packets with phase
> > 	2 - from the ACK of probe response packet
> >
> > periodicity: Periodicity in ms at which CFR dump need to be collect
> > 	0 - single shot capture
> > 	non zero - for Periodic captures
> >
> > mac_addr: mac address of the peer for which CFR capture is requested.
> >
> > Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> > ---
> > v2:
> >  * Updated the commit log.
> >
> 
> That's a bit better, thanks.
> 
> However, it still doesn't address the question of why it needs to be vendor
> specific API.
> 
> Is this something fundamentally tied to the hardware? Fundamentally
> vendor specific? I'm not sure I see why it would be?

CFR capture method can be different from HW to HW. Few HWs might not support all the methods.

> 
> johannes
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
