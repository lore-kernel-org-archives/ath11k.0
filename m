Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBxEN-0006Ou-PJ
 for ath11k@lists.infradead.org; Thu, 04 Apr 2019 07:56:17 +0000
Subject: Re: ath11k: Meshpoint interfaces with fw 0x30804a5
References: <cd1c5f61ef06cf858ad650c7529ed2ff@codeaurora.org>
 <ff33985163361d7ab73dd658e0410bf6@codeaurora.org>
 <11963916.mhQnyPb6De@bentobox>
From: John Crispin <john@phrozen.org>
Message-ID: <b9e41465-851d-de56-5f62-4df6219c9a33@phrozen.org>
Date: Thu, 4 Apr 2019 09:56:11 +0200
MIME-Version: 1.0
In-Reply-To: <11963916.mhQnyPb6De@bentobox>
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <seckelmann@datto.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: ath11k@lists.infradead.org


On 04/04/2019 08:45, Sven Eckelmann wrote:
> On Thursday, 4 April 2019 05:21:14 CEST Rajkumar Manoharan wrote:
> [...]
>> Below issues were observed in bring up and fixed in
>> WLAN.HK.2.1.0.1-00113-QCAHKSWPL_SILICONZ-1 firmware
>>
>> 1) Assert in mesh interface creation.
>> 2) Group action were filtered
>> 3) fix 4 addr in firmware for mesh peers
>>
>>
>> Moving forward please use 2.1.0-1 firmware release which is meant for
>> ath11k.
>> We are still working on to enable secured mesh (SAE).
> Thanks. So it looks like I was on the right track for the initial 11s sup=
port.
> We are using this firmware at the moment because I heard from John that t=
he
> newest(?) firmware was not working with the public available ath11k sourc=
es.
> But since I have absolutely no idea about the current firmware situation =
of
> ath11k and can also not find anything which sounds like 2.1.0-1 in Kalle's
> repo [1] (and I most likely mixed something up), I would like John to add=
 a
> comment about the current situation.
>
> Kind regards,
> 	Sven
>
> [1] https://github.com/kvalo/ath11k-firmware

Hi All,

we imported the latest FW into our tree and were seeing that the driver =

did not come up successfully. I have not looked into the details yet as =

I am busy working on the V4 of the 802.3 encap mode patches and the =

matching ath11k support patch. I will give it another try int he coming =

days.

 =A0=A0=A0 John


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
