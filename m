Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaen9-0004U8-EP
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 12:55:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id k3so2428982ejj.10
 for <ath11k@lists.infradead.org>; Thu, 05 Nov 2020 04:55:02 -0800 (PST)
Subject: Re: Regression: QCA6390 fails with "mm/page_alloc: place pages to
 tail in __free_pages_core()"
References: <d6fb1e30-0d19-9af3-337b-69ff11c2fc6c@suse.cz>
 <8ACA82DB-D2FE-4599-8A01-D42218FDE1E5@redhat.com>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <225718f1-c4b0-8683-427a-059148a39350@gmail.com>
Date: Thu, 5 Nov 2020 13:55:00 +0100
MIME-Version: 1.0
In-Reply-To: <8ACA82DB-D2FE-4599-8A01-D42218FDE1E5@redhat.com>
Content-Language: en-US
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Op 05.11.2020 om 12:13 schreef David Hildenbrand:
> It depends in which order memory is exposed to MM, which might depend on other factors in some configurations.
> 
> This smells like it exposes an existing bug. Can you reproduce also with zone shuffling enabled?

So just to make sure I understand you correctly, you'd like to see if the problem with ath11k driver on my hardware 
persists when I boot pristine 5.10-rc2 kernel (without reverting commit 7fef431be9c9ac255838a9578331567b9dba4477) and 
with page_alloc.shuffle=1, right?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
